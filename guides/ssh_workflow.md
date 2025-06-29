# OpenSSH Local Workflow
**Author:** Indrajit Ghosh  
**Affiliation:** Research Scholar, Indian Statistical Institute Bangalore  
**Website:** [Personal Homepage](https://indrajitghosh.onrender.com/)

A workflow for connecting to an OpenSSH server.

The following workflow I use when I want to connect to a server with `hostname`, say, `192.168.1.200` and `user`, say, `hagrid`:

1. First create a SSH key-pair on your local system by the following command

    ```bash
    ssh-keygen -t ed25519 -C "Local System Voldemort"
    ```
    It will opt for a file name give it a name like, `hagrid_key`. Next it will prompt for a passphrase, definitely give one.

2. Create a ssh `config` file for this
    ```bash
    vim ~/.ssh/config
    ```
    For the server `hagrid` you can add the following lines in the config file:
    ```sh
    Host hagrid
        HostName 192.168.1.200
        User hagrid
        IdentityFile ~/.ssh/hagrid_key
    ```

3. Now add the key to the server (`hagrid` here):
    ```bash
    ssh-copy-id -i ~/.ssh/<public_key>.pub hagrid
    # Note that the name 'hagrid' should be there in the config.
    ```

4. Cashe the ssh passphrase in the ssh-agent. This will save the server ssh passphrase to unlock the private key for the entire terminal session.
    ```bash
    eval $(ssh-agent) # Run the ssh-agent in the background
    ```
    This will echo the PID, say 2749. You can check that using the following command if you wish
    ```bash
    ps aux | grep 2749
    ```

5. Add the ssh key to the ssh-agent by the following command:
    ```bash
    ssh-add ~/.ssh/hagrid_key
    ```
