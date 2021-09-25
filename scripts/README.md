# Admin scripts

Prerequisites:

- `docker` CLI available in the system

when setting up a new machine for hackathons:

```sh
# run from the top of the source tree
scripts/create_hackathon_account
```

**Note**: The command above copies part of the source tree to the hackathon's home directory
and some of the commands stated below are run from this directory (`/home/hackathon`).

After that, the flow of the admin steps is:

## For each hackathon:

1. create a local clone of the hackathon repo:

```sh
cd /home/hackathon
git clone https://github.com/pmemhackathon/hackathon
```

2. create `/pmem0` and `/pmem1` mount points and provide them with DAX file system:

    - [Persistent Memory Provisioning Introduction](https://software.intel.com/content/www/us/en/develop/articles/qsg-intro-to-provisioning-pmem.html) or
    - an emulated one: https://pmem.io/2016/02/22/pm-emulation.html

3. create users, e.g.:

```sh
# creates all 200 accounts (run from the top of the source tree; as root)
scripts/create_pmemusers 1 200 hackathon
```

4. create a directory for the workshop

```sh
cd /home/hackathon/workshops
mkdir workshop_name
```

## Foreach session with same users (or on system boot)

1. enable the users

```sh
# enables a subset of users [1..100] (run from the top of the source tree; as root)
scripts/enable_pmemusers 1 100 todayspasswd
```

2. start the webhackathon daemon as root

```sh
cd /home/hackathon
./webhackathon hackathon &
```

**Note**: In case of a failure, you can investigate it by analyzing the content of the `/home/hackathon/logs/` directory.

Launch a web browser and navigate to the hackathon webpage (e.g. [127.0.0.1](http://127.0.0.1)) and ...hack...hack...hack.

* if system is rebooted, restart containers:

```sh
docker start $(docker ps -aq -f name=pmemuser)
```

users can be disabled selectively using the `docker stop` command.

## After everyone is done and won't come back:

1. kill the webhackathon daemon
2. stop and delete all docker containers

```sh
docker stop $(docker ps -aq -f name=pmemuser)
docker rm $(docker ps -aq -f name=pmemuser)
```

3. delete_pmemusers (removes all pmemuserX accounts)

**Note**: we assume ID:GID 5000:5000 for the hackathon account and the range 5001:5001 through 5200:5200 are available
for the 200 user accounts created.  edit all the scripts and change $BASEID if that has to change for some reason.

## Tips for developers

When making changes to:
- `<repo_dir>/docker/*` please see the note in the `<repo_dir>/docker/Dockerfile` file,
- `/home/hackathon/templates/examples/*/*.tmpl` files you have to restart the `webhackathon` daemon,
- `/home/hackathon/hackathon/*` files you have to:

```sh
# stop and delete all docker containers
docker stop $(docker ps -aq -f name=pmemuser)
docker rm $(docker ps -aq -f name=pmemuser)

# and recreate all users
./scripts/delete_pmemusers
create_pmemusers 1 200 hackathon
enable_pmemusers 1 100 todayspasswd
```
