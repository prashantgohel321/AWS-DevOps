# Day 05: Git & GitHub Advanced Concepts

## How to push or commit code to GitHub using VS Code

1.  Make sure Git is installed.
2.  **Initialize Git:**
    ```bash
    git init
    ```
3.  **Connect to GitHub repo:**
    ```bash
    git remote add origin <repo-url>
    ```
4.  **Stage and commit code:**
    ```bash
    git add .
    git commit -m "Your commit message"
    ```
5.  **Set the branch and push:**
    ```bash
    git branch -M main
    git push -u origin main
    ```

## I have 2 GitHub accounts. VS Code is signed in with my first account, but now I want to push code to a repository in my second GitHub account. However, VS Code is only showing the first account.

Here's how to resolve this:

1.  **First, check in terminal:**
    * `git init` (if not already initialized for the project)
    * `git config user.name`
    * `git config user.email`

2.  **Remove old GitHub credentials:**
    * **Credential Manager (Windows):** Find and remove any entries like `git:https://github.com` or `GitHub`.
    * **(Optional) Unset global Git user config in terminal:**
        ```bash
        git config --global --unset user.name
        git config --global --unset user.email
        ```

3.  **Set new GitHub account credentials:**
    ```bash
    git config --global user.name "your-new-username"
    git config --global user.email "your-new-email"
    ```

4.  **Connect to the repository for the second GitHub account:**
    ```bash
    git remote remove origin # Remove the old remote if it exists
    git remote add origin <new-repo-url>
    ```

5.  **Push code:**
    ```bash
    git add .
    git commit -m "Your commit message"
    git branch -M main # (if not already set)
    git push -u origin main
    ```
6.  GitHub will now prompt for login/token.

## What if I don't use `--global` in Git config (`user.name` & `user.email`)?

If you don't use `--global`, the Git settings (like username & email) will apply only to the current project (local), not system-wide. This is safer when using multiple GitHub accounts.

## What does `-M` mean when setting a Git branch (`git branch -M main`)?

`git branch -M main` means to move or rename the branch to `main`, even if a branch with that name already exists (it forces the rename). It's used when you want to rename the current branch.

## What is the meaning of `-u` in `git push`? And what is `origin`?

* **`-u` (--set-upstream):** In `git push -u origin main`, this option links your local `main` branch to the remote `main` branch on `origin`. So, next time you can just use `git push` or `git pull` without specifying the branch.
    * **Example:** `git push -u origin main` means "Push my code from my local `main` branch to the `main` branch on the GitHub repo I called `origin`, and remember this connection."

* **`origin`:** When we want to connect our local project to a GitHub repository, we use `git remote add origin <repo-url>`. Here, `origin` is just a nickname for that GitHub URL. We can set any name, but `origin` is the conventional default.
    * Think of `origin` as: "Hey Git, push my code to that GitHub repo I called `origin`."

## What does `git add .` do?

`git add .` stages all changed files (new, modified, deleted) in the current folder and subfolders, preparing them for the next commit. It stages files to be committed.

## How to clone a repository?

To clone a repository means to download a full copy of a project from GitHub to your local system.

1.  Go to the GitHub repo page.
2.  Click "Code".
3.  Copy the HTTPS URL.
4.  Open terminal & run:
    ```bash
    git clone <url>
    ```
5.  A folder with the repo name will be created with all files inside.

## Basic Git commands

1.  **`git init`**
    * Initializes a new Git repository in our current folder. Makes it a Git-tracked project.

2.  **`git clone <repo-url>`**
    * Downloads a full copy of a project from a remote repository to your local system.

3.  **`git status`**
    * Shows current changes, staged files, and untracked files.

4.  **`git add .`**
    * Stages all changes (new or edited files) for commit. Prepares files to be committed.

5.  **`git commit -m "message"`**
    * Saves the staged changes with a message.

6.  **`git remote add origin <repo-url>`**
    * Connects our local repo to a GitHub repo, with the name `origin`.

7.  **`git push -u origin main`**
    * Pushes our code to GitHub and sets a link between local `main` and remote `main`.

8.  **`git push`**
    * Pushes latest commits to GitHub (after initial `git push -u`).

9.  **`git pull`**
    * Pulls (downloads) the latest code from GitHub to your local repository.

10. **`git branch`**
    * Lists all branches in our project. The current one is highlighted.

11. **`git branch <name>`**
    * Creates a new branch.

12. **`git checkout <branch-name>`**
    * Switches to another branch.

13. **`git merge <branch-name>`**
    * Merges changes from another branch into the current branch.

14. **`git log`**
    * Shows a list of past commits with messages, authors, and time.

15. **`git config --global user.name "name"`**
    **`git config --global user.email "email"`**
    * To set Git username & Git email globally.

## What is the meaning of merging branches in Git?

Merging branches means combining the changes from one branch into another.

### Explanation and Real-life use:

Suppose you're working on a website.
You have the main code in the `main` branch.
You create a new branch called `contact-form` to build a contact form feature:
```bash
git checkout -b contact-form
```
Now you add code, test it, and commit it. Once done, you want to bring these changes into the `main` branch.
```bash
git checkout main # Go to main branch
git merge contact-form # Merge the contact-form branch into main
```
Now the `main` branch will have the contact form feature.

Merging helps you work on features separately without disturbing the main project. Once your work is ready and tested, you merge it back with the main code.

## What does `-b` mean in Git used with `git checkout` or `git switch`?

`-b` is used with `git checkout` or `git switch` to create a new branch and switch to it immediately.

### Example:
```bash
git checkout -b new-feature
```
This creates a new branch called `new-feature` and moves you into it.

## Correct Git Command sequence for a new project:

1.  **Initialize Git in the local folder:**
    ```bash
    git init
    ```
2.  **Add the GitHub repo as remote and name it `origin`:**
    ```bash
    git remote add origin <repo-url>
    ```
3.  **Rename current branch to `main`:**
    ```bash
    git branch -M main
    ```
4.  **Stage all files for the first commit:**
    ```bash
    git add .
    # or git add <specific-file>
    ```
5.  **Commit the staged changes with a message:**
    ```bash
    git commit -m "Initial commit"
    ```
6.  **Push to GitHub and set tracking between local `main` and remote `main`:**
    ```bash
    git push -u origin main
    ```

After this setup, next time we only need to use:
```bash
git add .
git commit -m "msg"
git push
