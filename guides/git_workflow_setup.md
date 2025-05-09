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

7. **Add SSH Public Key to GitHub**
   - Copy the key:
     ```
     cat ~/.ssh/id_ed25519.pub
     ```
   - Add it to GitHub:  
     GitHub > Settings > SSH and GPG Keys > New SSH Key

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

