# MySQL Community Server Installation Guide

This guide will walk you through the installation process of MySQL Community Server on Linux, macOS, and Windows.

- Author: [Indrajit Ghosh](https://github.com/indrajit912)

- GitHub URL: [MySQL Installation](https://github.com/indrajit912/HowTo/blob/master/guides/install_mysql.md)

- License: [MIT](../LICENSE)

## Table of Contents
- [Linux Installation](#linux-installation)
- [macOS Installation](#macos-installation)
- [Windows Installation](#windows-installation)

---

## Linux Installation

1. Open a terminal window.

2. Update the package list to ensure you have the latest information about available packages:
    ```
    sudo apt-get update
    ```

3. Install MySQL Server:
    ```
    sudo apt-get install mysql-server
    ```

4. During the installation, you will be prompted to set a root password for MySQL. Make sure to choose a strong password and remember it.

5. Start the MySQL service:
    ```
    sudo service mysql start
    ```

6. To ensure that MySQL starts automatically at boot, run the following command:
    ```
    sudo systemctl enable mysql
    ```

7. MySQL has been successfully installed and is now running on your Linux system. Initially, there is no password required to log in as the user root. To log in as root, utilize the following command:
    ```
    sudo mysql -u root
    ```

8. You can now establish a password for the root user through the following command within the MySQL shell:
    ```bash
    ALTER USER 'root'@'localhost' IDENTIFIED BY '<your_new_password>';
    ```
    For instance, if you wish to set the password as `hello123`, execute:

    ```bash
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'hello123';
    ```
    *NOTE*. If any issues arise during this process, you may attempt the following command prior to setting the new password:

    ```bash
    UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root';
    FLUSH PRIVILEGES;
    QUIT;
    ```

9. Once the new password has been successfully set, employ the following command to log in to the MySQL server as the `root` user:
    ```bash
    mysql -u root -p
    ```
---

## macOS Installation

1. Open a terminal window.

2. Install Homebrew if you haven't already. Visit [brew.sh](https://brew.sh/) for installation instructions.

3. Install MySQL Server using Homebrew:
    ```
    brew install mysql
    ```

4. Start the MySQL service:
    ```
    brew services start mysql
    ```

5. To ensure that MySQL starts automatically at login, run the following command:
    ```
    brew services enable mysql
    ```

6. MySQL is now installed and running on your macOS system. You can access it by running:
    ```
    mysql -u root
    ```

---

## Windows Installation

1. Download the MySQL Community Server installer for Windows from the official MySQL website [here](https://dev.mysql.com/downloads/mysql/).

2. Run the installer and follow the on-screen instructions.

3. During the installation, you will be prompted to set a root password for MySQL. Make sure to choose a strong password and remember it.

4. Complete the installation process.

5. MySQL is now installed and running on your Windows system. You can access it using MySQL Command Line Client or MySQL Workbench.

---

Congratulations! You have successfully installed MySQL Community Server on your Linux, macOS, or Windows system.

For more information and advanced configuration options, refer to the [official MySQL documentation](https://dev.mysql.com/doc/).
