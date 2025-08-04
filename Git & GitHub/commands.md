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