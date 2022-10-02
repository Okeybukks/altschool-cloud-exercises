# 10 CIS Ubuntu Linux Security Benchmark Implementation on my Vagrant Machine.

1. **Ensure password reuse is limited**
    To prevent reuse of same password, this line of command is added to the */etc/pam.d/common-password* file.

    ```
    password required pam_pwhistory.so remember=5
    ```
    This ensures, the last 5 paswords used by a user is not reused.

2. **Ensure minimum days between password changes is configured**
    In order to prevent user from circumventing the password reuse control, the minimum number of days before change of password is set to 1 or greater. This configuration is carried out in the *etc/login.defs* file by assigning *PASS_MIN_DAYS* a value greater than 0.
    ```
    PASS_MIN_DAYS	1
    ```
    To apply this rule to respectiver users, run the command;
    ```
    # chage --mindays 1 <user>
    ```
3. **Ensure password expiration is 365 days or less**
    To improve the security of your server, it is advised your password expiration days shouldn't exceed 365. The lesser this number, the lesser the window of opportunity an attacker has to compromise your server. The *PASS_MAX_DAYS* is set to a value less than 366 in the *etc/login.defs* file.
    ```
    PASS_MAX_DAYS	365
    ```
    To apply this rule to respectiver users, run the command;
    ```
    # chage --maxdays 365 <user>
    ```
4. **Ensure permissions on /etc/passwd are configured**
    The */etc/passwd* file contains account information that are needed by utilities in the system and thus need to be readable. Ability to write into this file must be by the root user alone. Its recommended permission is 644 and Uid and Gid are both 0/root.
    Run this command to check the permission and ID
    ```
    # stat /etc/passwd

    Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)
    ```
    To change to the recommended rule, run this command.
    ```
    # chown root:root /etc/passwd
    # chmod u-x,go-wx /etc/passwd
    ```
5. **Ensure permissions on /etc/group are configured**
    Same rule that applies for the */etc/passwd* file must also apply for the */etc/group* file.
    ```
    # stat /etc/group

    Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)
    ```
    To change to the recommended rule, run this command.
    ```
    # chown root:root /etc/group
    # chmod u-x,go-wx /etc/group
    ```
    Note: This configuration also applies to */etc/gshadow*, */etc/gshadow-*, */etc/shadow* etc files.
6. **Ensure password fields are not empty**
    Accounts without passwords are prone to be used by unauthorized personel in one's server, to prevent this from happening, all accounts without passwords are locked and then proper investigation are done as to why such an account has no password. To check for accounts without password run this command.
    ```
    # awk -F: '($2 == "" ) { print $1 " does not have a password "}' /etc/shadow
    ```
    To lock the account gotten from the output of the above command, run;
    ```
    # passwd -l <user> 
    ```
7.  **Ensure root is the only UID 0 account**
    The *root* user should be the only user with UID of 0. Any user with UID of 0 has superuser priviledges which might not be intended. Run the command to get other users with UID of 0 and if it exists such ID is changed.
    ```
    # awk -F: '($3 == 0) { print $1 }' /etc/passwd

    root
    ```
    To change user ID
    ```
    # usermod <new ID> <user>
    ```
8. **Ensure ufw is installed**
    Our server without its firewall exposes it to all matter of threats. It is paramount one ensures firewall is installed on the server he/she is working on. To check if firewall is installes run;
    ```
    # dpkg -s ufw | grep 'Status: install'

    Status: install ok installed 
    ```
    If it's not installed, run this command to install firewall into the server.
    ```
    # apt install ufw
    ```
9. **Ensure iptables-persistent is not installed with ufw**
    It has been observed running both ufw and iptables-persistent services usually causes conflict which might expose your servers to threats. To prevent this ensure you dont have iptables-persistent installed in your server. To check if it is installed run this command;
    ```
    # dpkg-query -s iptables-persistent

    package 'iptables-persistent' is not installed and no information is available
    ```
    If iptables-persistent is installed, run this command to remove it.
    ```
    # apt --purge iptables-persistent
    ```
10. **Ensure ufw service is enabled**
    To ensure the ufw service is always active immediately after boot, it is good practice its service is set to *enabled*.
    To check if the firewall is enabled;
    ```
    # systemctl is-enabled ufw

    enabled
    ```
    If it is not enabled, run this command;
    ```
    # ufw enable
    ```
