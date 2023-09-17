# My Git Repositary Workflow

In this document, I outline the standard steps I follow whenever I create a new Git repository.

- Author: [Indrajit Ghosh](https://github.com/indrajit912)

- GitHub URL: [My GitHub Reposatry Workflow](https://github.com/indrajit912/HowTo/blob/d2c23dab3cfa56454197153f1d411b36dcd7937c/guides/install_latex.md)

- License: [MIT](../LICENSE)

## Step 1: Creating an SSH Key (if not already created)

To push your local Git repository to a remote repository (e.g., GitHub, GitLab), you'll need an SSH (public and private) RSA key pair. Follow these steps to create the RSA key pair:

1. First, ensure that `ssh` is installed on your system. Here are the commands to install ssh on various systems:

    For Linux:

    You typically don't need to install ssh separately on most Linux distributions as it's usually included by default. However, you can check if it's installed by running:

    ```bash
    ssh -V 
    ```
    If it's not installed, you can install it using your distribution's package manager. For example, on Ubuntu/Debian, you can use:

    ```bash
    sudo apt-get install openssh-client
    ```

    For Windows:

    Windows 10 and later versions come with an OpenSSH client pre-installed. To check if it's installed or install it manually, you can follow these steps:

    - Open PowerShell as an administrator.
    - Run the following command to check if OpenSSH is installed:

        ```bash
        Get-WindowsCapability -Online | ? Name -like 'OpenSSH.Client*'
        ```
    - If it's not installed, you can install it using:
        ```bash
        Add-WindowsCapability -Online -Name OpenSSH.Client*
        ```

2. Change the directory to `~/.ssh`. If this directory does not exist, you can create it:

    ```bash
    cd ~/.ssh # Create this directory if it doesn't exist
    ```

3. Generate the SSH key pair using the appropriate command based on your operating system:

    For Linux or MacOS:

    ```bash
    ssh-keygen
    ```

    For Windows:

    ```bash
    ssh-keygen.exe
    ```

    During this process, you may be prompted for input; you can generally press ENTER to accept the default values.

4. After completing the key generation, you will have two files: `id_rsa` (the private key, which must be kept secret) and `id_rsa.pub` (the RSA public key). You can copy the contents of `id_rsa.pub` and paste it into your GitHub (or GitLab) account settings to enable secure access.


## Step 2: Adding SSH Public Key to GitHub

Follow the steps below to add your public key to GitHub:

1. Log in to your GitHub acc.
2. Goto `settings`
3. Click onto `SSH and GPG keys`
4. Click on the button `New SSH key` to add your key!


## Step 3: Initialize `git` To Local Repositary.
1. `cd` to your local repositary path
2. Use the following command to initialize `git` inside your local repositary:
    ```bash
    git init
    git branch -M master
    ```
3. Make some changes in your local repo. Then `add` them and `commit` them using:
    ```bash
    git add . # add them
    git commit -m "<MESSAGE>" # commit changes
    # For example,
    git commit -m "The bug fixed!"
    ```

4. Add remote repositary (such as GitHub repositary) to your local repo:
    ```bash
    git remote add <REMOTE_REPO_NAME> <REMOTE_REPO_URL>
    ```
    For example, you can use something like:
    ```bash
    git remote add origin https://github.com/your-github-repo
    ```
    Or, 
    ```bash
    git remote add overleaf https://overleaf.com/your-overleaf-project
    ```
5. You can see all remote address by the following:
    ```bash
    git remote -v
    ```


## Step 4: Pushing your local repo to GitHub

Use the following cmds inside your local repositary to push it to your GitHub everytime.
```bash
git push -u <remote_name> <branch_name>
```
For example,
```bash
git push -u origin master
```

