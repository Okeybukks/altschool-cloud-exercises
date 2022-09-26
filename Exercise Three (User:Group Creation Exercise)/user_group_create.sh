#!bin/bash

ssh_key_lenght='2048'

# Create the groups (if does not exist)
read -p "Please input User: " user 
user_check=$( compgen -u | grep ${user} )
if [ -z ${user_check} ]
then
	sudo useradd -m -s /bin/bash ${user}
	echo "\n Please input password for ${user}"
	sudo passwd ${user}
else
	echo "${user} user already exist!"
fi

# Give user sudo priviledges if you want
read -p "Add ${user} to sudo group (y/n): " sudo_add
if [ $sudo_add='y' ]
then
	sudo usermod -aG sudo ${user}
fi

# Create '.ssh' directory in user's home directory
user_ssh_directory=/home/${user}/.ssh
if ! [ -d $user_ssh_directory ]
then
	sudo mkdir $user_ssh_directory
fi
user_ssh_file=./${user}_sshkey

# Generate ssh-key pair and move them to correspondig user's '.ssh/' dir.
ssh-keygen -t rsa -b $ssh_key_lenght -N "" -f $user_ssh_file

sudo mv $user_ssh_file "${user_ssh_file}.pub" $user_ssh_directory

# Create the groups (if does not exist)
read -p "Do you wish to create a group (y/n): " group_add
if [ $group_add='y' ]
then
	read -p "Please input User: " group 
	group_check=$( compgen -g | grep ${group} )
	if [ -z ${group_check} ] ;then
		sudo groupadd ${group}

		read -p "Do you wish to add ${user} to ${group} y/n: " add_user_group
		if [ $add_user_group='y' ]
		then
			# Assign relevant group to the new user
  			sudo usermod -aG ${group} ${user}

	fi

fi

echo "${user} sshkey has been generated"