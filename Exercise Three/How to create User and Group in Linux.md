# How we go fit create User, Group for our Ubuntu Server
For this matter wey dey do so, na user and group we wan create for our ubuntu server. If we wan run this parol so, we go need make sure we dey use the 'sudo'
  command follow body the command we go need use run the group and user creation. 
 
 Na three groups we wan create so. The three groups na admin, support and engineering. As e dey so we no fit create the three groups at the same time, 
 we go run the matter one by one. We dey run am one by one no mean say another sharp method like 'for loop' no dey but for simplicity sake we go run
 am one by one. Oya run this commads to create the groups.
  
  ```
  sudo groupadd admin
  sudo groupadd support
  sudo groupadd engineering
  ```
If you wan see the groups you just create now now, you go run

```
cat /etc/group 
```
For my own server, as I run am see wetin I get

```
...
vagrant:x:1000:
systemd-coredump:x:999:
ubuntu:x:1001:
vboxsf:x:998:
admin:x:1002:
support:x:1003:
engineering:x:1004:
```
The next matter we go run next na to join the **admin** group for the sudoers group. This matter na very simple one. Wetin we go do an to add this line of code 
join the */etc/sudoers* file.

```
%admin ALL=(ALL) ALL
```
Because say */etc/sudoers* na special file, just running
```
vi /etc/sudoers
```
no go work, to edit this special file you go need run this command to open the file con add that line of code wey dey up.

```
sudo visudo /etc/sudoers
```
Once you don edit the file save, gbam, your **admin** group don dey the sudoer file. Once you run 
```
sudo cat /etc/sudoers
```
You suppose see something like this.
```
vagrant@ubuntu-focal:~$ sudo cat /etc/sudoers
#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults	env_reset
Defaults	mail_badpass
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root	ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d
```
The next matter we go run now na to create a user for each group wey we just create. To run this one so we go run the following commands one by one. Omo, 
the *achebe_admin* wey you dey see na the username I choose for my own user wey I create oooo.
```
  sudo useradd -g admin -m -s /bin/bash achebe_admin
  sudo useradd -g support -m -s /bin/bash achebe_support
  sudo useradd -g engineering -m -s /bin/bash achebe_engineering
```
Make I try explain some flags/option I add for the user creation command.
```
  -s => specify the kind shell you want make your user get.
  -g => specifiy the group you wan add this user
  -m => this one go make your user get in own home directory
```
To see this users you done great, you go run this command.
```
cat /etc/passwd | grep achebe
```
As I run this command, na my output be this.
```

vagrant@ubuntu-focal:~$ cat /etc/passwd | grep achebe
  achebe_admin:x:1002:1002::/home/achebe_admin:/bin/bash
  achebe_support:x:1003:1003::/home/achebe_support:/bin/bash
  achebe_engineering:x:1004:1004::/home/achebe_engineering:/bin/bash
```
The last matter we go like run so na to create create *SSH keys* for the **admin** group wey be *achebe_admin*.
Before we go create this SSH Keys for our user, we go need login as that user. To login as *achebe_admin*, make we first create in password. To run this one
we go need run this command.
```
sudo passwd achebe_admin
```
Prompt go comot make you put in new password, once you done run am finish you now fit login as that user. Run this command to login as the *achebe_admin* 
user.
```
sudo su achebe_admin
```
One prompt go show make you put that password you just create, put am and you go see yourself for *achebe_admin user*. Now wey we dey *achebe_admin user* 
you go need run this command to generate the SSH key.
```
ssh-keygen
```
You go see propmt wey go as you where you wan save the keys, just press enter make e save for the folder e dey suggest give you. For the passphrase wey e 
go prompt you, just press enter make we no use any passprase and we done finish so. If you wan see the created ssh key just go the .ssh/ folder for the home 
directory, you go see am there.


