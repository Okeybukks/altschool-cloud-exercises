**Task**

1. Create an Ansible Playbook to setup a server with Apache
2. The server should be set to the Africa/Lagos Timezone
3. Host an index.php file with the following content, as the main file on the server: 
    ```
    <?php
     echo date("F d, Y h:i:s A e", time());
    ?>
    ```

    Instruction:
Submit the Ansible playbook, the output of systemctl status apache2 after deploying the playbook and a screenshot of the rendered page