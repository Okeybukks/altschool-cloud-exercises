# Installation of PHP 7.4 on Ubuntu from ppa:ondrej/php package repo

![alt text](https://agaetis.tech/wp-content/uploads/2020/07/How-to-Install-Linux-Server-for-php-and-MySql.png)

The installation of PHP 7.4 on an Ubuntu Linux Distro is pretty straight forward. The following steps are to be taken for the successful installation of
PHP in an Ubuntu machine and also securely transferring the */etc/apt/sources.list*, */etc/apt/sources.list.d/ondrej-ubuntu-php-focal.list*, and *php -v* file
into a local machine hosting the Ubuntu machine.

Firstly, add the *ppa:ondrej/php* package repo to your package index using the *add-apt-repository* commamnd. To go about this, you can copy the line of
command below.
```
  sudo add-apt-repository ppa:ondrej/php -y
```
The above command will add the repo needed to get PHP installed in the Ubuntu machine.

Secondly, because a new repo has been added, you need to update your package index so as to freshen your repo. This update can be done using the command below
```
  sudo apt update
```
Thirdly, upgrade all packages after the addition of a new repo and repo update using the command below.
```
  sudo apt upgrade
```
Once all of this is done, you can now install PHP into the Ubuntu machine using this command;
```
  sudo apt install php7.4 -y
```

To safely transfer the following output of this files and command i.e */etc/apt/sources.list*, */etc/apt/sources.list.d/ondrej-ubuntu-php-focal.list* and
*php -v* to our local machine we need to first save their output in their respective files. To achieve this, the following commands are run.
```
  sudo cat /etc/apt/sources.list > source_list.txt
  
  sudo cat /etc/apt/sources.list.d/ondrej-ubuntu-php-focal.list > source_list_d.txt
  
  php -v > php_version.txt
```
To transfer this files to a local machine, run this command.
```
  scp vagrant@ip_address_of_vagrant_ubuntu_machine:/home/vagrant/\{php_version.txt,source_list.txt,source_list_d.txt\} location_in_local_machine
```
Please note; before running this command, there must be an established ssh connection between ypur local_machine and your Ubuntu machine.




