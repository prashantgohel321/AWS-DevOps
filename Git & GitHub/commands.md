# Useful Git Commands

A curated list of Git commands for analyzing repositories, tracking contributions, and debugging.

## Table of Contents

### [Commit & Author Insights](#-commit--author-insights)
- [1. Show commits by a specific contributor](#1-show-commits-by-a-specific-contributor)
- [2. Store commit history to a file](#2-store-commit-history-to-a-file)
- [3. Count commits per contributor](#3-count-commits-per-contributor)
- [4. Show files changed by a contributor](#4-show-files-changed-by-a-contributor)

### [File & Code History](#-file--code-history)
- [5. See who changed what and when (Blame)](#5-see-who-changed-what-and-when-blame)
- [6. Show a file's history](#6-show-a-files-history)
- [7. Find commits that changed specific lines](#7-find-commits-that-changed-specific-lines)
- [8. Show the difference for a file between two commits](#8-show-the-difference-for-a-file-between-two-commits)

### [Timeline & Project Overview](#-timeline--project-overview)
- [9. View commit history as a graph](#9-view-commit-history-as-a-graph)
- [10. See commits within a date range](#10-see-commits-within-a-date-range)

### [Cleanup & Debugging](#-cleanup--debugging)
- [11. Preview untracked files before deleting](#11-preview-untracked-files-before-deleting)
- [12. Delete untracked files](#12-delete-untracked-files)
- [13. Find deleted files in commit history](#13-find-deleted-files-in-commit-history)

### [Stats & Reports](#-stats--reports)
- [14. Show commit count per day](#14-show-commit-count-per-day)
- [15. Show diff stats for a contributor](#15-show-diff-stats-for-a-contributor)

---

## Commit & Author Insights

Commands to get information about commits and contributors.

### 1. Show commits by a specific contributor
- **Use**: Filter commits by a contributor, showing the commit hash, message, and date.
- **Command**:
  ```bash
  git log --author="Author Name" --pretty=format:"%h - %s (%ci)"
  ```
- **Example**:
  ```bash
  git log --author="Prashant Gohel" --pretty=format:"%h - %s (%ci)"
  ```
- **Sample Output**:
  ```
  a7c3e1b - Added Dockerfile for backend (2025-08-10 14:21:33 +0530)
  98d23f1 - Fixed EC2 security group issue (2025-08-08 09:10:45 +0530)
  ```

### 2. Store commit history to a file
- **Use**: Save the formatted commit history of a specific contributor to a text file.
- **Command**:
  ```bash
  git log --author="Author Name" --pretty=format:"%h - %s (%ci)" > commits.txt
  ```
- **Example**:
  ```bash
  git log --author="Prashant Gohel" --pretty=format:"%h - %s (%ci)" > prashant_commits.txt
  ```

### 3. Count commits per contributor
- **Use**: Quickly see how many commits each person has made.
- **Command**:
  ```bash
  git shortlog -sn
  ```
- **Sample Output**:
  ```
     56  Prashant Gohel
     43  Tanvir Mulla
     12  John Doe
  ```

### 4. Show files changed by a contributor
- **Use**: Find all unique files a specific contributor has worked on.
- **Command**:
  ```bash
  git log --author="Author Name" --name-only --pretty=format: | sort | uniq
  ```
- **Example**:
    ```bash
    git log --author="Prashant Gohel" --name-only --pretty=format: | sort | uniq
    ```
- **Sample Output**:
  ```
  Dockerfile
  README.md
  src/main/java/App.java
  ```

---

## File & Code History

Commands to inspect changes to files and lines of code.

### 5. See who changed what and when (Blame)
- **Use**: See who last touched each line of a file. This is useful for finding out who wrote a specific piece of code.
- **Command**:
  ```bash
  git blame path/to/file
  ```
- **Example**:
    ```bash
    git blame src/main/java/App.java
    ```
- **Sample Output**:
  ```
  a7c3e1b (Prashant Gohel 2025-08-10 14:21:33 +0530 1) public static void main(String[] args) {
  98d23f1 (Tanvir Mulla  2025-08-08 09:10:45 +0530 2)     System.out.println("Hello World");
  ```

### 6. Show a file's history
- **Use**: Track all changes made to a file, even if it was renamed.
- **Command**:
  ```bash
  git log --follow path/to/file
  ```
- **Example**:
    ```bash
    git log --follow src/main/java/App.java
    ```
- **Sample Output**:
  ```
  commit a7c3e1b
  Author: Prashant Gohel
  Date:   Tue Aug 10 14:21:33 2025 +0530

      Added main method

  commit 98d23f1
  Author: Tanvir Mulla
  Date:   Mon Aug 8 09:10:45 2025 +0530

      Created App.java
  ```

### 7. Find commits that changed specific lines
- **Use**: Shows the history for a specific range of lines in a file.
- **Command**:
  ```bash
  git log -L <start_line>,<end_line>:path/to/file
  ```
- **Example**:
    ```bash
    git log -L 20,30:src/main/java/App.java
    ```

### 8. Show the difference for a file between two commits
- **Use**: Compare the changes made to a single file between two different commits.
- **Command**:
  ```bash
  git diff <commit1> <commit2> -- path/to/file
  ```

---

## Timeline & Project Overview

Commands for a high-level view of the project's history.

### 9. View commit history as a graph
- **Use**: Visualize branches and merges to understand the project's history flow.
- **Command**:
  ```bash
  git log --oneline --graph --all --decorate
  ```
- **Sample Output**:
  ```
  * a7c3e1b (HEAD -> main, origin/main) Added Dockerfile
  | * 12f9c21 (feature-ec2) EC2 instance setup
  |/
  * 98d23f1 Initial commit
  ```

### 10. See commits within a date range
- **Use**: Filter and view commits made within a specific period.
- **Command**:
  ```bash
  git log --since="YYYY-MM-DD" --until="YYYY-MM-DD" --pretty=format:"%h - %s (%ci)"
  ```
- **Example**:
    ```bash
    git log --since="2025-08-01" --until="2025-08-10" --pretty=format:"%h - %s (%ci)"
    ```
- **Sample Output**:
  ```
  a7c3e1b - Added Dockerfile for backend (2025-08-10 14:21:33 +0530)
  98d23f1 - Fixed EC2 security group issue (2025-08-08 09:10:45 +0530)
  ```

---

## Cleanup & Debugging

Commands to help clean your working directory and find issues.

### 11. Preview untracked files before deleting
- **Use**: Shows which untracked files will be removed without actually deleting them (a "dry run").
- **Command**:
  ```bash
  git clean -n
  ```
- **Sample Output**:
  ```
  Would remove temp.log
  Would remove build/
  ```

### 12. Delete untracked files
- **Use**: Permanently removes untracked files from your working directory. **Use with caution!**
- **Command**:
  ```bash
  git clean -f
  ```

### 13. Find deleted files in commit history
- **Use**: See which files have been deleted in past commits.
- **Command**:
  ```bash
  git log --diff-filter=D --summary
  ```
- **Sample Output**:
  ```
  commit a7c3e1b...
  Author: Prashant Gohel
  Date:   ...

      Refactored configuration

   delete mode 100644 old_config.yml
  ```

---

## Stats & Reports

Commands to generate statistics about the repository.

### 14. Show commit count per day
- **Use**: Displays the number of commits made each day.
- **Command**:
  ```bash
  git log --date=short --pretty=format:'%ad' | sort | uniq -c
  ```
- **Sample Output**:
  ```
    2 2025-08-01
    5 2025-08-02
    1 2025-08-05
  ```

### 15. Show diff stats for a contributor
- **Use**: Shows the number of lines added and removed (insertions/deletions) for each commit by a specific author.
- **Command**:
  ```bash
  git log --author="Author Name" --stat
  ```
- **Example**:
    ```bash
    git log --author="Prashant Gohel" --stat
    ```
- **Sample Output**:
  ```
  commit a7c3e1b...
  Author: Prashant Gohel
  Date:   ...

      Updated application logic

   src/main/java/App.java | 10 ++++++----
   1 file changed, 6 insertions(+), 4 deletions(-)

  commit 98d23f1...
  Author: Prashant Gohel
  Date:   ...

      Added Dockerfile

   Dockerfile             |  5 +++--
   1 file changed, 3 insertions(+), 2 deletions(-)
  