# Day 05 Linux Pro Commands

## List of Contents

* <a href="#awk_main">01 `awk`</a>
    * <a href="#awk_why_learn">01.01 Why Learn This?</a>
    * <a href="#awk_what_is">01.02 What is awk?</a>
    * <a href="#awk_syntax">01.03 Basic `awk` syntax</a>
    * <a href="#awk_common_examples">01.04 Common Examples</a>
    * <a href="#awk_count_occurrences">01.05 Count Occurrences</a>
    * <a href="#awk_filter_by_time">01.06 Filter by Time</a>
    * <a href="#awk_print_line_numbers">01.07 Print Lines Between Line Numbers</a>
    * <a href="#awk_powerful">01.08 Why awk is Powerful?</a>
* <a href="#awk_sed_diff">02 Difference between `awk` and `sed`</a>
    * <a href="#awk_sed_summary">02.01 Summary: awk vs sed</a>
    * <a href="#awk_sed_devops_use_cases">02.02 Real-World DevOps Use Cases (awk)</a>
* <a href="#sed_main">03 `sed`</a>
    * <a href="#sed_what_is">03.01 What is sed?</a>
    * <a href="#awk_sed_comparison">03.02 `awk` vs `sed` (Detailed Comparison)</a>
    * <a href="#sed_basic_syntax">03.03 Basic Syntax (sed)</a>
    * <a href="#sed_search_replace">03.04 Search & Replace</a>
    * <a href="#sed_show_line_numbers">03.05 Show Line Numbers with a Match</a>
    * <a href="#sed_replace_range">03.06 Replace Only in a Specific Line Range</a>
    * <a href="#sed_print_first_10_changed">03.07 Print Only the First 10 Changed Lines</a>
    * <a href="#sed_devops_use_cases">03.08 Real-World DevOps Use Cases (sed)</a>
    * <a href="#sed_summary_cheat_sheet">03.09 Summary Cheat Sheet (sed)</a>
* <a href="#grep_main">04 `grep`</a>
    * <a href="#grep_what_is">04.01 What is grep?</a>
    * <a href="#grep_basic_usage">04.02 Basic Usage (grep)</a>
    * <a href="#awk_sed_grep_diff">04.03 `awk` vs `sed` vs `grep` – What's the Difference?</a>
    * <a href="#grep_devops_use_case_example">04.04 DevOps Use Case Example (grep)</a>
    * <a href="#grep_powerful_flags">04.05 Bonus: Powerful Grep Flags</a>
* <a href="#summary_choose_tool">05 Summary: Choose the Right Tool</a>

---

<section id="awk_main">

## `awk`
<section id="awk_why_learn">

### 🧾 Why Learn This?
When working as a DevOps engineer, you’ll deal with large log files, CSV data, or system outputs. You often need to extract specific parts, count things, or filter content quickly.

Now you have two choices:
- 📜 Write a shell script
- ⚙️ Use a powerful one-liner tool like awk

</section>

<section id="awk_what_is">

### 🔍 What is awk?
awk is a text-processing command in Linux. It’s like a mini programming language for working with structured text files like .log, .csv, .tsv, etc.

#### ✨ Key Use Cases:
- Extract specific columns from a file
- Filter lines based on keywords (like INFO, ERROR)
- Apply conditions and loops
- Count things (like how many times something occurred)

#### 🍽️ Analogy: Restaurant Waiter vs awk
> Just like a waiter serves you specific items from a full menu...

> awk serves you specific parts from a full text file 🍲

</section>

---

<section id="awk_syntax">

### Basic `awk` syntax:
```bash
awk '{ action }' filename
```

- $1, $2, $3 → Represent columns
- NR → Current row number
- print → Displays output

</section>

---

<section id="awk_common_examples">

### Common Examples
#### 1️⃣ Print the whole content of a file:
```bash
awk '{print}' app.log
```

#### 2️⃣ Print the first column:
```bash
awk '{print $1}' app.log
```

#### 3️⃣ Print multiple columns (1st, 2nd, 3rd, 5th):
```bash
awk '{print $1, $2, $3, $5}' app.log
```

#### 4️⃣ Print only lines that contain the word INFO:
```bash
awk '/INFO/ {print $1, $2, $3, $5}' app.log
```

#### 5️⃣ Save the filtered INFO lines to a new file:
```bash
awk '/INFO/ {print $1, $2, $3, $5}' app.log > only_info.log
```

</section>

<section id="awk_count_occurrences">

### 🔢 Count Occurrences
#### Count how many times INFO appears:
```bash
awk '/INFO/ {count++} END {print count}' app.log
```

#### With a custom message:
```bash
awk '/INFO/ {count++} END {print "The count of INFO is", count}' app.log
```

</section>

<section id="awk_filter_by_time">

### ⏱️ Filter by Time (e.g., Between 08:53:00 and 08:53:59)
#### Let’s say your log’s second column is a timestamp:
```bash
awk '$2 >= "08:53:00" && $2 <= "08:53:59" {print $3}' app.log
```

</section>

<section id="awk_print_line_numbers">

#### 📑 Print Lines Between Line Numbers 2 to 10
```bash
awk 'NR >= 2 && NR <= 10 {print}' app.log
```

To print the row numbers:
```bash
awk 'NR >= 2 && NR <= 10 {print NR}' app.log
```

</section>

---

<section id="awk_powerful">

### 🧠 Why awk is Powerful?
- Supports conditions, loops, ranges, and custom logic
- Can act like a mini-programming language for text
- Works great with formatted data like .csv, .tsv, .log

> ⚠️ Works best with structured/column-based files

</section>
</section>

---

<section id="awk_sed_diff">

## Difference between `awk` and `sed`
| Feature       | awk                                   | sed                                                 |
| :------------ | :------------------------------------ | :-------------------------------------------------- |
| **Purpose** | Programming-style text processor      | Stream editor                                       |
| **Best Used For** | Parsing and processing structured files (logs, CSV) | Find & replace, line edits, simple filters          |
| **Limitation** | Needs structured formats              | Not good for complex logic                          |

</section>

---

<section id="awk_sed_summary">

### ✅ Summary:
- Use `awk` when you want columns, conditions, counts, loops
- Use `sed` when you want quick replacements or line changes

</section>

---

<section id="awk_sed_devops_use_cases">

### 👨‍💻 Real-World DevOps Use Cases
- Parse logs to extract IPs, timestamps, or error types
- Generate quick reports from .csv files
- Filter logs based on date/time or event type
- Count occurrences of issues in system logs

</section>

---

<section id="sed_main">

## 🔧 What is sed?
<section id="sed_what_is">

sed stands for **`Stream Editor`**. It reads input line by line (as a stream), performs operations (like search, replace, delete), and outputs the result.

> 💡 Think of sed as a robot that edits your file while reading it — no need to open it in an editor.

</section>

---

<section id="awk_sed_comparison">

### `awk` vs `sed`
| Feature        | awk                                       | sed                                            |
| :------------- | :---------------------------------------- | :------------------------------------------- |
| **Use-case** | Extracting, printing, filtering structured data | Editing and transforming text                |
| **Syntax style** | Mini-programming language with `{}`       | Expression-based (no `{}`)                   |
| **Data structure** | Works with columns (CSV/TSV/logs)       | Works line-by-line, unstructured             |
| **Ideal for** | Reports, CSVs, log filtering            | Search & replace, quick edits                |

</section>

---

<section id="sed_basic_syntax">

### Basic Syntax:
```bash
sed 'expression' filename
```

### Lets compare it with awk:
```bash
awk '/INFO/' app.log
sed -n '/INFO/p' app.log
```

> In sed, if you want to only show matched lines, you must use the -n flag:
```bash
sed -n '/INFO/p' app.log
```

</section>

<section id="sed_search_replace">

### 🔁 Search & Replace
#### Replace all instances of INFO with LOG in the entire file:
```bash
sed 's/INFO/LOG/g' app.log
```bash
# - s = substitute
# - INFO = the pattern to search
# - LOG = replacement
# - g = globally (all matches on the line)
```

</section>

---

<section id="sed_show_line_numbers">

### 🔢 Show Line Numbers with a Match
#### Show only line numbers where INFO appears:
```bash
sed -n -e '/INFO=/' app.log

# Explanation:
# -n: suppress automatic printing
# -e: execute expression
# /INFO/=: print line numbers where match found
```

### Show both line numbers and matching lines:
```bash
sed -n -e '/INFO/=' -e '/INFO/p' app.log
```

</section>

---

<section id="sed_replace_range">

### 🔄 Replace Only in a Specific Line Range
#### Replace INFO with LOG only in the first 10 lines:
```bash
sed '1,10 s/INFO/LOG/g' app.log
```

</section>

---

<section id="sed_print_first_10_changed">

### 📜 Print Only the First 10 Changed Lines
```bash
sed '1,10 s/INFO/LOG/g; 1,10p; 11q' app.log

# 🧠 What’s going on here?
# 1,10 s/INFO/LOG/g → Replace within lines 1 to 10
# 1,10p → Print only lines 1 to 10
# 11q → Quit after line 10 (no extra output)
# ; → Separates multiple commands
```

</section>

---

<section id="sed_devops_use_cases">

## 👨‍💻 Real-World DevOps Use Cases
| Use Case               | Example                                     |
| :--------------------- | :------------------------------------------ |
| Replace config variables | Replace localhost with IP                   |
| Clean up logs          | Remove or mask sensitive data               |
| Automation             | Update version tags or comments in scripts  |
| Pipeline               | Use in Dockerfile, CI/CD shell, bash scripts |

</section>

---

<section id="sed_summary_cheat_sheet">

## 🔚 Summary Cheat Sheet
| Task                          | sed Command                                   |
| :---------------------------- | :-------------------------------------------- |
| Match lines                   | `sed -n '/INFO/p' app.log`                    |
| Replace globally              | `sed 's/INFO/LOG/g' app.log`                  |
| Replace in range              | `sed '1,10 s/INFO/LOG/g'`                     |
| Show line numbers with match  | `sed -n -e '/INFO/=' app.log`                 |
| Show both line & content      | `sed -n -e '/INFO/=' -e '/INFO/p'`            |
| Replace & print only 10 lines | `sed '1,10 s/INFO/LOG/g; 1,10p; 11q' app.log` |

</section>
</section>

---

<section id="grep_main">

## 🚦 What is grep?
<section id="grep_what_is">

grep stands for **`Global Regular Expression Print`**.

It’s like a powerful filter — it scans a file or stream, searches for a pattern, and prints only those lines that match.

### 🎯 Real-Life Analogy
Imagine you’re reading a 200-page book 📖, but you’re only interested in the pages that talk about "AWS". Instead of reading the whole book, you just search for the word "AWS" and mark those pages.

That’s what grep does — it finds and highlights the relevant lines in big files like logs, scripts, or processes.

</section>

---

<section id="grep_basic_usage">

### ✅ Basic Usage
Find lines containing the word INFO:
```bash
grep INFO app.log
```

### Case-insensitive search:
```bash
grep -i info app.log
# -i makes the search case-insensitive
```

### Count how many matches:
```bash
grep -i -c info app.log
# -c stands for count of matching lines
```

### 💡 Same Thing in awk?
You can get the same count in awk like this:

```bash
awk '/INFO/ {count++} END {print count}' app.log
```

> **So why do we need both?** <br>
> Because each tool has different strengths.

</section>

---

<section id="awk_sed_grep_diff">

## 🔄 awk vs sed vs grep – What's the Difference?
| Tool  | Best For                       | Structure Needed        | Real Power                      |
| :---- | :----------------------------- | :---------------------- | :------------------------------ |
| grep  | Simple search and match        | No structure needed     | Fast filtering                  |
| awk   | Column-based logic             | Needs structured data   | Logic, conditions, counters     |
| sed   | Inline editing                 | Works line-by-line      | Search & replace, line edit     |

</section>

---

<section id="grep_devops_use_case_example">

## 👨‍💻 DevOps Use Case Example
### See all running processes:
```bash
ps aux
```

### Filter only processes run by ubuntu user:
```bash
ps aux | grep ubuntu
```

### Now get only the 2nd column (PID):
```bash
ps aux | grep ubuntu | awk '{print $2}'
# ps aux shows all processes
# grep ubuntu filters processes started by the ubuntu user
# awk '{print $2}' shows the process ID
```

</section>

---

<section id="grep_powerful_flags">

## 🚀 Bonus: Powerful Grep Flags
| Flag | Meaning                   | Example                          |
| :--- | :------------------------ | :--------------------------------- |
| `-i` | Ignore case               | `grep -i info app.log`           |
| `-c` | Count matches             | `grep -c INFO app.log`           |
| `-v` | Invert match (exclude pattern) | `grep -v INFO app.log`           |
| `-n` | Show line numbers         | `grep -n INFO app.log`           |
| `-r` | Recursive search in folders | `grep -r "ERROR" /var/logs/`     |

</section>

---

<section id="summary_choose_tool">

## 🔚 Summary: Choose the Right Tool
| Task                                    | Tool |
| :---------------------------------------- | :--- |
| Quick search                              | grep |
| Column-based filtering or counting        | awk  |
| Inline find & replace                     | sed  |
| Complex report from structured logs       | awk  |
| Editing config files or scripts in place | sed  |

</section>
