# Git Setup and Local Workflow
**Author:** Indrajit Ghosh  
**Affiliation:** Research Scholar, Indian Statistical Institute Bangalore  
**Website:** [Personal Homepage](https://indrajitghosh.onrender.com/)

> A checklist for setting up Git, GPG, and SSH on a new system, along with instructions for local repository workflow.


## First Time Setup

1. **Check Git Installation**
   - Ensure Git is installed: `git --version`
   - If not installed, install it using your system's package manager (e.g., `sudo apt install git` on Debian/Ubuntu).

2. **Install GPG**
   - Required for signing commit messages.
   - Install via: `sudo apt install gnupg`

3. **Generate GPG Keys**
   - Create a new GPG key pair:
     ```
     gpg --full-generate-key
     ```
   - List keys:
     ```
     gpg --list-secret-keys --keyid-format=long
     ```
   - Set the signing key in Git:
     ```
     git config --global user.signingkey <your-key-id>
     git config --global commit.gpgsign true
     ```

4. **Add GPG Public Key to GitHub**
   - Export public key:
     ```
     gpg --armor --export <your-key-id>
     ```
   - Add it to GitHub:  
     GitHub > Settings > SSH and GPG Keys > New GPG Key

5. **⚠️ Important: When Commit Email Differs from GPG UID**

    If the `user.email` in your Git config is different from the email(s) attached to your GPG key, GPG will **refuse to sign** the commit unless that email is also a UID on the key.

    **To fix this:**

    1. Open your GPG key for editing:
    
       ```bash
       gpg --edit-key <your-key-id>
       ```
    
    2. Add a new UID (email identity). Enter the following interactive commands:
    
       ```bash
       adduid
        # You'll be prompted for:
        #   Real name: Indrajit Ghosh
        #   Email address: <Enter The Email You wanna Add>
        #   Comment: (leave blank or put something like "My work email")
        #   Change (O)kay? o
    
        save
       ```
    
    
    3. (Optional) Re-export and re-import this key on your other machines if needed.
    
    > 💡 This allows you to keep your work email (`user.email`) for commits while signing them with your personal GPG key.
    

5. **Install OpenSSH**
   - Required for SSH authentication.
   - Install via:
     ```
     sudo apt install openssh-client openssh-server
     ```

6. **Generate SSH Key Pair**
   - Run:
     ```
     ssh-keygen -t ed25519 -C "my_github_email@example.com"
     ```
    
    > Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
    ```bash
    ssh-keygen -t rsa -b 4096 -C "my_github_email@example.com"
    ```
   - By default, it saves to `~/.ssh/id_ed25519`.

7. **Add custom SSH key to ~/.ssh/config**
    - Open the SSH config file (create it if it doesn’t exist):
    ```bash
    vim ~/.ssh/config
    ```
    Add this block (replace github_custom_key with your actual private key filename):
    ```bash
    Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_custom_key
    ```

8. **Add SSH Public Key to GitHub**
   - Copy the key:
     ```
     cat ~/.ssh/id_ed25519.pub
     ```
   - Add it to GitHub:  
     GitHub > Settings > SSH and GPG Keys > New SSH Key

9. **Test your SSH setup with GitHub**
    - After adding your key and updating ~/.ssh/config, run this command:
      ```bash
      ssh -T git@github.com
      ```
      If it's working correctly, you'll see a message like:
      ```bash
      Hi your-username! You've successfully authenticated, but GitHub does not provide shell access.
      ```
---

## Local Workflow

1. **Initialize Repository**
```bash
git init
```

2. **Make Changes**
- Edit or create files as needed.

3. **Stage Changes**
```bash
git add .
```

4. **Commit with Signature**
```bash
git commit -S -m "A commit message"
```

5. **Push Changes**
- Set the remote (if not already set):
  ```
  git remote add origin git@github.com:username/repo.git
  ```
- Push:
  ```
  git push -u origin main
  ```

