# Install Koha
This guide provides you a step-by-step installation process of Koha.

## Requirements
1. A Linux server
2. MySQL
3. apache2
4. perl

## Installation

1. First add the Koha Community repository to their system's sources.list file. Goto [Koha Community webpage](https://download.koha-community.org/) to see which line to add for the stable release of Koha. Typically it's 
`deb http://debian.koha-community.org/koha stable main`

2. Open a new terminal and open the `sources.list` file in nano editor:
    ```bash
    sudo nano /etc/apt/sources.list
    ```
    In this file add the line 
    ```bash
    deb http://debian.koha-community.org/koha stable main
    ```

3. Add the Koha GPG Key by the following command:
    ```bash
    wget -O- https://debian.koha-community.org/koha/gpg.asc | sudo apt-key add -
    ```

    You could probably see the following output:
    ```bash
    Resolving debian.koha-community.org (debian.koha-community.org)... 67.220.127.145
    Connecting to debian.koha-community.org (debian.koha-community.org)|67.220.127.145|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 59549 (58K) [text/plain]
    Saving to: ‘STDOUT’

    -                   100% [===============================================================================>]  58.15K  40.5KB/s    in 1.4s 
    ```

    If you see this output this means everything is good and you can simply ignore the current terminal window and open a new window to perform the next commands.

4. Update and upgrade your server by the following command:
    ```bash
    sudo apt update && sudo apt upgrade && sudo apt clean
    ```
    Prompt `y` when asked. This will download `koha-community` to your server.

5. Install the latest Koha Release by the following command now:
    ```bash
    sudo apt install koha-common
    ```

6. Install Apache web server if you haven’t already.
    ```bash
    sudo apt install apache2
    ```

7. Install MySQL. You can follow [this  guide](./install_mysql.md).

8. Enable the Apache mod_rewrite modules.
    ```bash
    sudo a2enmod rewrite sudo a2enmod cgi sudo systemctl restart apache2.service
    ```

9. Create the Library Instance.
    ```bash
    sudo koha-create --create-db demo
    ```
    “demo” can be anything you want (make it short, simple, and sensible though). This will be the name of your Koha library instance.

10.  Configure your server for an IP-based installation:

        - Decide which ports use.
        In this example,we’ll use 7001 for the OPAC and 7002 for the Staff page but it can be anything you like (except ports 0 – 1023, these are reserved ports and are used by default by various applications). If you are using a firewall (which you should!) allow access to these two ports.

        - Open your instance config.
        ```bash
        sudo nano /etc/apache2/sites-available/demo.conf
        ```

        - Change the virtual host of your OPAC section from 
        ```bash
        <VirtualHost *:80>
        ```
        to
        ```bash
        <VirtualHost *:7001>
        ```

        - Change the virtual host of your Staff section from
        ```bash
        <VirtualHost *:80>
        ```
        to 
        ```bash
        <VirtualHost *:7002>
        ```

        - Replace the ServerAdmin email in both VirtualHost sections with your own. This will be visible to users when they encounter a problem and enable them to contact you.

        - Close and save your config file.

        - Edit your ports.conf and add your two ports to the Listen directive
        ```bash
        sudo nano /etc/apache2/ports.conf
        ```

        - Add the following lines below the existing directives (you should have Listen 80 already enabled. Do not delete any directives that you find in this file, unless you know what you’re doing of course).
        ```bash
        Listen 7001 
        Listen 7002
        ```

        - Close and save the file.

11. Enable your Koha instance.
    ```bash
    sudo a2enmod deflate sudo a2ensite library
    ```
12. Check your Apache config for syntax errors and restart.
    ```bash
    sudo apachectl configtest
    ```
    This command should return “Syntax Ok”. If not, go back to your config file (/etc/apache2/sites-available/demo.conf) and fix any errors. Then run:

    ```bash
    sudo systemctl restart apache2
    ```

13. Complete the web setup.

    To complete Koha’s web setup, you will need your admin username and password. My instance is called demo, so my username is koha_demo (if your instance is called library, your username will be koha_library, etc.). To get the password, run this command in your terminal (replace demo with your library name):
    ```bash
    sudo koha-passwd demo
    ```

14. Open a web browser and go to your staff URL (`http:localhost:7002`). Enter your username and password and follow the prompts.