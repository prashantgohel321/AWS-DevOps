```bash
git log --author="Author Name" --pretty=format:"%h - %s (%ci)" > commits.txt

Example:
git log --author="Prashant Gohel" --pretty=format:"%h - %s (%ci)" > prashant_commits.txt
```

> The command I likely gave you to store the commit history of a specific contributor in a .txt file

### Explanation:
- **`--author="Author Name"`**: Filter commits by a specific contributor.

- **`--pretty=format`**:"%h - %s (%ci)": Format the output to show commit hash, message, and commit date.

- > **`commits.txt`**: Save the output to a file named commits.txt.



--------

<br>
<br>
<br>

### All commits by a contributor (detailed)
```bash
git log --author="Author Name"
```

```bash
git shortlog -sn
    43  prashantgohel321
    36  tanvirmulla11
    11  Gohel Prashant
     5  prashant321
     2  prashantgohel11
     1  tanvirmulla73@gmail.com
```

---

<br>
<br>
<br>

### Count total commits by each contributor
```bash
git shortlog -sn
```
### Example Output:
```bash
git shortlog -sn
    43  prashantgohel321
    36  tanvirmulla11
    11  Gohel Prashant
     5  prashant321
     2  prashantgohel11
     1  tanvirmulla73@gmail.com
```

---


### Count commits by a specific author

```bash
git shortlog -sn --author="Author Name"
```

---

<br>
<br>
<br>

### Show files changed by a specific contributor:
```bash
git log --author="Author Name" --name-only --pretty=format: | sort | uniq
```

<br>
<br>
<br>

### See who last modified each line (blame):

```bash
git blame path/to/file
```

---

<br>
<br>
<br>

### Diff for a specific file between commits:

```bash
git diff commit1 commit2 -- path/to/file
```

<br>
<br>
<br>

### See commit history as a graph (great for teams):

```bash
git log --oneline --graph --all --decorate
```

<br>
<br>
<br>

### See untracked files:

```bash
git clean -n
```

> Add -f to actually delete them:

```bash
git clean -f
```


---


<br>
<br>
<br>

## Commit & Author Insights

### Show commits by a specific contributor
```bash
git log --author="Prashant Gohel" --pretty=format:"%h - %s (%ci)"
```

- **Use**: Filter commits by a contributor, showing hash, message, and date.

Sample Output:
```bash
a7c3e1b - Added Dockerfile for backend (2025-08-10 14:21:33 +0530)
98d23f1 - Fixed EC2 security group issue (2025-08-08 09:10:45 +0530)
```

---

<br>
<br>
<br>

### Count commits per contributor
```bash
git shortlog -sn
```

- **Use**: Quickly see who contributed how much.
Sample Output:

```bash
   56  Prashant Gohel
   43  Tanvir Mulla
   12  John Doe
```

---

<br>
<br>
<br>

### Show files changed by a contributor
```bash
git log --author="Prashant Gohel" --name-only --pretty=format: | sort | uniq
```

- **Use**: Find all files a contributor worked on.
Sample Output:

```bash
Dockerfile
src/main/java/App.java
README.md
```

<br>
<br>
<br>

## File & Code History

### Who changed what line (Blame)
```bash
git blame src/main/java/App.java
```

- **Use**: See who last touched each line of a file and when.

Sample Output:
```bash
a7c3e1b (Prashant Gohel 2025-08-10 14:21:33 +0530) public static void main(String[] args) {
98d23f1 (Tanvir Mulla 2025-08-08 09:10:45 +0530)     System.out.println("Hello World");
```

<br>
<br>
<br>

### Show file history
```bash
git log --follow src/main/java/App.java
```

- **Use**: Track changes to a file, even after renaming.

Sample Output:
```bash
commit a7c3e1b
Author: Prashant Gohel
Date:   Tue Aug 10 14:21:33 2025 +0530

    Added main method

commit 98d23f1
Author: Tanvir Mulla
Date:   Mon Aug 8 09:10:45 2025 +0530

    Created App.java
```

<br>
<br>
<br>

## Timeline & Project Overview

### Commit graph
```bash
git log --oneline --graph --all --decorate
```

- **Use**: Visualize branches and merges.

Sample Output:
```bash
* a7c3e1b (HEAD -> main, origin/main) Added Dockerfile
| * 12f9c21 (feature-ec2) EC2 instance setup
|/
* 98d23f1 Initial commit
```

<br>
<br>
<br>

### Commits in date range
```bash
git log --since="2025-08-01" --until="2025-08-10" --pretty=format:"%h - %s (%ci)"
```
- **Use**: See commits within a period.
Sample Output:

```bash
a7c3e1b - Added Dockerfile for backend (2025-08-10 14:21:33 +0530)
98d23f1 - Fixed EC2 security group issue (2025-08-08 09:10:45 +0530)
```

<br>
<br>
<br>

## Cleanup & Debugging

### Show untracked files


```bash
git clean -n
```
- **Use**: Preview untracked files that can be deleted.

Sample Output:

```bash
Would remove temp.log
Would remove build/
```

<br>
<br>
<br>

### Find deleted files
```bash
git log --diff-filter=D --summary
```

- **Use**: See files deleted in commits.

Sample Output: 
```bash
delete mode 100644 old_config.yml
```

<br>
<br>
<br>

### Find commits touching specific lines

```bash
git log -L 20,30:src/main/java/App.java
```
- **Use**: Shows history for specific line numbers in a file.

Sample Output:

```bash
commit a7c3e1b
Author: Prashant Gohel
Changed line 20 from `System.out.println("Test")` to `System.out.println("Hello")`
```

<br>
<br>
<br>

## 📊 Stats & Reports
### Commits per day

```bash
git log --date=short --pretty=format:'%ad' | sort | uniq -c
```
- **Use**: Shows daily commit count.

Sample Output:

```bash
  2 2025-08-01
  5 2025-08-02
  1 2025-08-05
```

<br>
<br>
<br>

### Contributor's diff stats

```bash
git log --author="Prashant Gohel" --stat
```

- **Use**: Shows number of changes (insertions/deletions) for each commit.

Sample Output:

```bash
src/main/java/App.java | 10 ++++++----
Dockerfile             |  5 +++--
```