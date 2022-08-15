<h1>Important Linux Commands</h1>

1. <b>ifconfig</b> <br>
This command is used to display the network interfaces in a linux machine. It is also used to initialize and configure network interfaces.
```
  ip a
  
```
Its out is;
```
achebeh@achebeh:~$ ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::a00:27ff:fe67:703e  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:67:70:3e  txqueuelen 1000  (Ethernet)
        RX packets 235177  bytes 326110217 (326.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 75349  bytes 4566883 (4.5 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.3  netmask 255.255.255.0  broadcast 192.168.56.255
        inet6 fe80::a00:27ff:fed6:b51a  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:d6:b5:1a  txqueuelen 1000  (Ethernet)
        RX packets 6231  bytes 548965 (548.9 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 4848  bytes 934280 (934.2 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 242  bytes 29391 (29.3 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 242  bytes 29391 (29.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

<img src="ifconfig.png" alt="ifconfig" width="400"/>
