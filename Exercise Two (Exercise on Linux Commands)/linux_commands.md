<h1>Important Linux Commands</h1>

1. <b>ifconfig</b> <br>
This command is used to display the network interfaces in a linux machine. It is also used to initialize and configure network interfaces.
```
  ip a
```
```
achebeh@achebeh:~$ ifconfig
  enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
          inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
          inet6 fe80::a00:27ff:fe67:703e  prefixlen 64  scopeid 0x20<link>
          ether 08:00:27:67:70:3e  txqueuelen 1000  (Ethernet)
          ...

  enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
          inet 192.168.56.3  netmask 255.255.255.0  broadcast 192.168.56.255
          inet6 fe80::a00:27ff:fed6:b51a  prefixlen 64  scopeid 0x20<link>
          ether 08:00:27:d6:b5:1a  txqueuelen 1000  (Ethernet)
          ...

  lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
          inet 127.0.0.1  netmask 255.0.0.0
          inet6 ::1  prefixlen 128  scopeid 0x10<host>
          loop  txqueuelen 1000  (Local Loopback)
          ...
```

2. <b>ping</b> <br>
  This command is really useful in networking in the linux OS, it helps to check connctivity between two nodes. It can also be used to check if your server has internet connection.
  ```
  achebeh@achebeh:~$ ping google.com
    PING google.com (216.58.223.206) 56(84) bytes of data.
    64 bytes from los02s03-in-f14.1e100.net (216.58.223.206): icmp_seq=1 ttl=63 time=5.36 ms
    64 bytes from los02s03-in-f14.1e100.net (216.58.223.206): icmp_seq=2 ttl=63 time=5.31 ms
    64 bytes from los02s03-in-f14.1e100.net (216.58.223.206): icmp_seq=3 ttl=63 time=6.40 ms
    64 bytes from los02s03-in-f14.1e100.net (216.58.223.206): icmp_seq=4 ttl=63 time=5.99 ms
    64 bytes from los02s03-in-f14.1e100.net (216.58.223.206): icmp_seq=5 ttl=63 time=5.77 ms
    64 bytes from los02s03-in-f14.1e100.net (216.58.223.206): icmp_seq=6 ttl=63 time=5.02 ms

    --- google.com ping statistics ---
    6 packets transmitted, 6 received, 0% packet loss, time 5010ms
    rtt min/avg/max/mdev = 5.017/5.641/6.400/0.464 ms
  ```
  
3. <b>ps</b> <br>
  The ps stands for "Process Status", this command is used to print out the processes currently running on your server. Alongside the processes, it also shows the process ID and depending on the option given, it prints out relevant information about the running process.
  ```
  achebeh@achebeh:~$ ps
    PID TTY          TIME CMD
   1826 pts/0    00:00:00 bash
  49507 pts/0    00:00:00 ps
  ```
4. <b>zip</b> <br>
  To zip files into one zip file, the zip command comes pretty handy.
  To zip a file:
  ```
    zip zip_file_name.zip file1, file2, file3 ...
  ```
  
  ```
  achebeh@achebeh:~$ zip f.zip m.txt myfile2.txt newfile.txt 
    adding: m.txt (deflated 34%)
    adding: myfile2.txt (deflated 33%)
    adding: newfile.txt (deflated 33%)
  ```
5. <b>cal</b> <br>
  A useful command used by system adminstrator to check calender of the current month and even the whole year is the cal command.
  
  ```
  achebeh@achebeh:~$ cal
        August 2022       
    Su Mo Tu We Th Fr Sa  
        1  2  3  4  5  6  
     7  8  9 10 11 12 13  
    14 15 16 17 18 19 20  
    21 22 23 24 25 26 27  
    28 29 30 31  
```
6. <b>df</b> <br>
  The df(Disk File) command is used to retrieve the data of the file system in your machine.
  ```
  achebeh@achebeh:~$ df -h
    Filesystem                         Size  Used Avail Use% Mounted on
    tmpfs                               98M  1.2M   97M   2% /run
    /dev/mapper/ubuntu--vg-ubuntu--lv  8.1G  6.7G  985M  88% /
    tmpfs                              486M     0  486M   0% /dev/shm
    tmpfs                              5.0M     0  5.0M   0% /run/lock
    /dev/sda2                          1.7G  244M  1.4G  15% /boot
    tmpfs                               98M  4.0K   98M   1% /run/user/1000
  ```
7. <b>hostnamectl</b> <br>
  If you wish to get information such as kernel version, OS your machine is running on, hostname, hardware model etc., the hostnamectl is your best bet to get such information.
  ```
  achebeh@achebeh:~$ hostnamectl
     Static hostname: achebeh
           Icon name: computer-vm
             Chassis: vm
          Machine ID: 1c091aa57527486c8eb855f373b8300b
             Boot ID: c86af5d6d2b7460cbac7e8e91e8c07f2
      Virtualization: oracle
    Operating System: Ubuntu 22.04.1 LTS              
              Kernel: Linux 5.15.0-43-generic
        Architecture: x86-64
     Hardware Vendor: innotek GmbH
      Hardware Model: VirtualBox
 ```
 8. <b>history</b> <br>
  You get to a point where as an administrator you wish to see the linux commands you've be running, the history command is used to retrieve previously ran commands.
  ```
  achebeh@achebeh:~$ head | history
    1  exit
    2  clear
    3  ifconfig
    4  sudo apt install net-tools
    5  ifconfig
    6  shutdown
    7  sudo shutdown
    8  clear
    9  cat /etc/*release*
   10  cat /etc/ssh/sshd.config
   11  cat /etc/ssh/sshd_config
  ```
 9. <b>find</b> <br>
 There are days you wish to locate a file, but you've got no idea its complete file name, the find command can help you locate it. It sho;d be noted important options need too be given to locate the file such as -name, -size etc.
 To find a file:
 ```
  find directory -type -name -size -i
 ```
 ```
 achebeh@achebeh:~$ find . -type f -name "my*.txt"
    ./myfile2.txt
 ```
 10. <b>pipe</b> <br>
  The pipe(|) command is used to combine two or more commands together. It works such that the output of the first command is the input for the second.
  ```
  achebeh@achebeh:~$ cat myfile2.txt | grep "offers"
    Baeldung offers a great range of Python tutorials.
  ```
