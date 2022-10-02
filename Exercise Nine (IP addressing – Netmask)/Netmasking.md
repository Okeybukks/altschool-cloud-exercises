**Calculation of Network IP, Number of hosts, Range of IP addresses and Broadcast IP from a given Subnet.**

The sample IP and subnet for the above calculations is 193.16.20.35/29. The IP address is 193.16.20.35 and subnet is /29.

1. **Calculating Network IP.**
    In the calulation of Network IP, the ip and subnet in binary form are necessary to get the Network IP. The binary form of the subnet is 29 up bits and 3 down bits which sums up 32 bits the allowed number of bits in an IP. The ups are designated 1 while downs 0.
    ```
        29 => 11111111.11111111.11111111.11111000
    ```
    For the IP, each decimal value in the IP is converted to its binary form.
    ```
        193.16.20.35 => 11000001.00010000.00010100.00100011
    ```
    The network address is the **logical AND** of the respective bits in the binary representation of the IP address and subnet(network mask)
    ```
        193.16.20.35 => 11000001.00010000.00010100.00100011
        29           => 11111111.11111111.11111111.11111000
                        --------- logical AND -------------
                        11000001.00010000.00010100.00100000
    ```
    The **logical AND** value got is then converted to its decimal value to get its Network IP.
    ```
        11000001.00010000.00010100.00100000 => 193.16.20.32
    ```
    Therefore the Network IP of 193.16.20.35/29 is **193.16.20.32**

2. **Number of hosts.**
    The number of hosts that can be assigned IPs on 193.16.20.35/29 is given by the formula
    ```
        Maximum Number of hosts = 2**(32 - netmask_length) - 2
        
        *where netmask_length = subnet value*
    ```
    The minus 2 in the formula is to account for addresses reserved for the Network and Broadcast address.
    ```
        Maximum Number of hosts = 2**(32 - 29) - 2
        Maximum Number of hosts = 6
    ```
    The number of hosts that can be asigned IP's on the network is **6**.
3. **Calculating Broadcast IP**
    To get the broadcast IP, the host bits of the subnet value are converted to ones, and network bits are converted to zeros.
    ```
        11111111.11111111.11111111.11111000 => 00000000.00000000.00000000.00000111
    ```
    The broadcast IP is gotten by getting the **logical OR** operation of the IP address and the new subnet value.
    ```
        193.16.20.35     => 11000001.00010000.00010100.00100011
        New subnet value => 00000000.00000000.00000000.00000111
                            ----------- logical OR ------------
                            11000001.00010000.00010100.00100111
    ```
    The **logical OR** value got is then converted to its decimal value to get its Network IP.
    ```
        11000001.00010000.00010100.00100111 => 193.16.20.39
    ```
    Therefore the Network IP of 193.16.20.35/29 is **193.16.20.39**
4. Range of IP Addresses
    The range of IP addresses that can be assigned to hosts lie in between the value of the **Network IP** and the **Broadcast IP** i.e **193.16.20.32 - 193.16.20.39**.
    ```
        193.16.20.33
        193.16.20.34
        193.16.20.35
        193.16.20.36
        193.16.20.37
        193.16.20.38
    ```
    The above IPs are the acceptable IPs that can be assigned to hosts.

