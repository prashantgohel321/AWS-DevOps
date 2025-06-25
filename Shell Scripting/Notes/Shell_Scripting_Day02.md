# 🐧 Shell Scripting for DevOps – Day 02
📅 Date: 25th June, 2025 | 📍 Topic: Shell Scripting Basics – Variables, Arguments, Conditionals, Loops & Functions

---

### 💬 Let's Start with a Simple Question:
> Have you ever wished your terminal could think, decide, or repeat tasks for you?

That’s exactly what Shell Scripting enables you to do!

---

## 🧱 Foundation First – What You’ll Learn Today:
* <a href="#variables">01 Variables in Shell</a>
* <a href="#arguments">02 Arguments in Shell Scripts</a>
* <a href="#conditionals">03 Conditionals (if, else, elif)</a>
* <a href="#loops">04 Loops – For and While</a>
* <a href="#functions">05 Functions in Shell</a>
* <a href="#summary_table">06 Summary Table</a>

---

<section id="variables">

## 📦 1. Variables in Shell
Variables are containers for values. You can assign, modify, and use them just like in any programming language.

🧪 Example:
```bash
#!/bin/bash

name="Prashant"
echo "Name is $name"

#Use $name to refer to the variable.
```

You can even run Linux commands inside variables:

```bash
echo "Current Date: $(date)"
```

### ⌨️ Take Input from User
```bash
read -p "Enter your username: " username
echo "You entered: $username"
```

Want to do something with that user?

```bash
sudo useradd -m $username
echo "User added!"
```
✅ Check new users in:

```bash
cat /etc/passwd
```

</section>

<section id="arguments">

## 🧳 2. Arguments in Shell Scripts
### 📌 What are Arguments?
These are the values you pass while running the script.

For example:

```bash
./script.sh Prashant 25 Developer

# Here:
# $0 → script name (script.sh)
# $1 → "Prashant"
# $2 → "25"
# $3 → "Developer"
```

🧪 Example:
```bash
#!/bin/bash

echo "Script Name: $0"
echo "Name: $1"
echo "Age: $2"
echo "Role: $3"
```

</section>

---

<section id="conditionals">

## 🧠 3. Conditionals (if, else, elif)
💡 Use conditionals when your script needs to make decisions.

🧪 Basic Syntax:
```bash
if [[ condition ]]; then
    # code if true
elif [[ another_condition ]]; then
    # code if elif true
else
    # code if all false
fi
```

Example:

```bash
read -p "Enter a number: " num

if [[ $num -gt 10 ]]; then
    echo "Greater than 10"
elif [[ $num -eq 10 ]]; then
    echo "Exactly 10"
else
    echo "Less than 10"
fi
```

</section>

---

<section id="loops">

## 🔁 4. Loops – For and While
### 🔄 for Loop
Create 5 folders with names like demo1, demo2, etc.

```bash
for (( num=1; num<=5; num++ ))
do
    mkdir "demo$num"
done
```

🛠 Dynamic Folder Creation with Arguments
```bash
#!/bin/bash
# $1 → base folder name, $2 → start range, $3 → end range

for (( i=$2; i<=$3; i++ ))
do
    mkdir "$1$i"
done
```

Run as:

```bash
./script.sh Prashant 5 10
# This creates Prashant5 to Prashant10
```
To delete:

```bash
rm -r Prashant*
```

### 🔁 while Loop
```bash
num=0
while [[ $num -le 5 ]]
do
    echo "Count: $num"
    num=$((num + 1))   # Correct arithmetic syntax
done
```

### 🔢 Print Even Numbers using while
```bash
num=0
while [[ $num -le 10 ]]
do
    if [[ $((num % 2)) -eq 0 ]]; then
        echo "$num"
    fi
    num=$((num + 1))
done
```
> Use (( )) for arithmetic operations.

### 🧮 Expressions Explained
There are two main ways to do math in shell:

> expr → older, more compatible

> $(( )) → modern and preferred

Examples:

```bash
expr 5 + 3          # Returns 8
echo $((5 + 3))     # Also returns 8
```

</section>

---

<section id="functions">

## 🧰 5. Functions in Shell
Why copy-paste code again and again? Wrap it in a function and reuse!

🧪 Syntax:
```bash
function say_hello() {
    echo "Hello from function!"
}

say_hello   # Call it
```

### 🛠 Folder Creation with Function & Arguments
```bash
function add_users() {
    name=$1
    start=$2
    end=$3

    for (( i=$start; i<=$end; i++ ))
    do
        mkdir "$name$i"
    done
}

# Call it with:
add_users "Prashant" 1 5
```

</section>

---

<section id="summary_table">

## ✅ Summary Table
| Concept     | Use Case                      | Syntax/Command Example             |
| ----------- | ----------------------------- | ------------------------------------ |
| Variable    | Store data                    | `name="Prashant"`                  |
| Argument    | Pass data via CLI             | `$1`, `$2`, etc.                   |
| Conditional | Make decisions                | `if [[ ... ]]; then ... fi`        |
| For Loop    | Repeat with counter           | `for (( i=1; i<=5; i++ ))`         |
| While Loop  | Repeat until condition breaks | `while [[ condition ]]; do ... done` |
| Function    | Reuse logic                   | `function_name() { ... }`            |
| Arithmetic  | Perform calculations          | `num=$((num + 1))`, `expr 5 + 3`   |

</section>
