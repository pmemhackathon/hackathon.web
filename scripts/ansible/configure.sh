#!/bin/bash

[ -z `which ansible-playbook` ] && echo "Please install ansible before proceeding" && exit 1

echo "Enter ip address to platform to configure"
read ip_address

echo "Enter password for root user"
read -s password

echo "Select what operation do you want - enter '1' for installing packages and configure docker, enter '2' for configuring goals and namespaces, enter '3' for downloading hackathon repos and configure webserver"
read option

if [[ $option == 1 ]]
then
    ansible-playbook -i $ip_address, configure_packages.yml --extra-vars "ansible_user=root ansible_password=$password"
fi

if [[ $option == 2 ]]
then
    ansible-playbook -i $ip_address, configure_namespaces.yml --extra-vars "ansible_user=root ansible_password=$password"
fi

if [[ $option == 3 ]]
then
    echo "Enter address for hackathon's webserver repo"
    read web_repo_address
    echo "Enter address for hackathon's code sample repo"
    read code_repo_address
    echo "Enter password for pmem users"
    read pmem_users_pass

    echo "Connecting to hackathon platform to install certificates. Please enter root password for that platform and answer all questions required by certbot."

    ssh root@$ip_address 'certbot certonly --standalone'

    echo "Next steps are executed using Ansible script. If there were some problems with certbot, you can execute this command 'certbot certonly --standalone' manually"
    echo "Press Enter to continue"
    read

    ansible-playbook -i $ip_address, configure_repo.yml --extra-vars "ansible_user=root ansible_password=$password web_repo_address=$web_repo_address code_repo_address=$code_repo_address pmem_users_pass=$pmem_users_pass"
fi