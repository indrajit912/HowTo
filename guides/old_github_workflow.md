# My Git Repositary Workflow

In this document, I outline the standard steps I follow whenever I create a new Git repository.

- Author: [Indrajit Ghosh](https://github.com/indrajit912)

- GitHub URL: [My GitHub Reposatry Workflow](https://github.com/indrajit912/HowTo/blob/master/guides/github_workflow.md)

- License: [MIT](../LICENSE)

## Step 1: Initialize `git` To Local Repositary.
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

## Step 2: Creating an personal access token in GitHub

To push your local Git repository to a remote repository (e.g., GitHub, GitLab), you'll need a personal access token from github. Generate one for yourself by:

- Log into your github account.
- Go to `settings`
- Click on `<> Developer settings`
- Generate a new personal access token (classic). Don't forget to tick appropriate rights for this token.
- Copy the token and store it somewhere temporarily!

## Step 3: Pushing your local repo to GitHub

Use the following cmds inside your local repositary to push it to your GitHub everytime.
```bash
git push -u <remote_name> <branch_name>
```
For example,
```bash
git push -u origin master
```
This will ask for the `username` and `password`. For the password enter the token that you generated earlier and hit ENTER.

Now store your credentials on your local machine
```bash
git config --global credential.helper store
```

This will store the token in your local machine so that from next time onward you don't need to enter username and password.


