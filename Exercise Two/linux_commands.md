<h1>Important Linux Commands</h1>

1. <b>ifconfig</b> <br>
This command is used to display the network interfaces in a linux machine. It is also used to initialize and configure network interfaces.
```
  ip a
  
```
Its output is;
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
4. <b>ps</b> <br>
