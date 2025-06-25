# What is Localhost?

## List of Contents
* <a href="#localhost_intro">01 What is Localhost?</a>
    * <a href="#what_happens_type_localhost">01.01 So What Happens When You Type localhost in a Browser?</a>
    * <a href="#localhost_ip">01.02 Localhost = 127.0.0.1</a>
    * <a href="#loopback_interface">01.03 What is 127.0.0.1 and the Loopback Interface?</a>
    * <a href="#can_we_change_name">01.04 Can We Change the Name?</a>
    * <a href="#why_useful">01.05 Why Is Localhost Useful?</a>
* <a href="#xampp_apache_php">02 Why do we need XAMPP and Apache to run PHP on localhost?</a>
    * <a href="#step_by_step_flow">02.01 Step-by-Step Flow: What Happens Under the Hood</a>
    * <a href="#cant_open_file_directly">02.02 Why Can’t We Just Open the File Directly?</a>

---

<section id="localhost_intro">

# What is Localhost?

“localhost” is not just some made-up programmer term. It’s an actual **reserved keyword** that always points to **your own computer**. Think of it like your computer’s **home address** in the digital world.

</section>

<section id="what_happens_type_localhost">

### 🤔 So What Happens When You Type localhost in a Browser?

Let’s compare:When you type google.com, your computer asks a **DNS (Domain Name System)** to translate that name into an IP address, like 142.250.182.206, which is one of Google’s servers. Your request travels across the internet to reach Google.

But...When you type localhost, your computer doesn’t bother asking DNS. It already knows what to do. 👉 It skips all that and directly points **back to itself**. That’s why it’s called **“local” host** — because it's all happening on your own device.

</section>

<section id="localhost_ip">

### 💡 Localhost = 127.0.0.1

Under the hood, localhost is just a nickname for the IP address 127.0.0.1.

* On **Windows**, open this file: `C:\Windows\System32\drivers\etc\hosts`

* On **Linux/Mac**, open: `/etc/hosts`


Inside, you’ll see a line like this: `127.0.0.1 localhost`

This means your computer is told: “Hey, if someone types localhost, just treat it like 127.0.0.1.”

</section>

<section id="loopback_interface">

### 🔄 What is 127.0.0.1 and the Loopback Interface?

The IP 127.0.0.1 is a **special address** that tells your computer: “Send this request to **yourself**.” You’re basically **talking to yourself**, digitally. 🤝

This is done via something called the **loopback interface** — a virtual network device that doesn’t connect to the internet or anything outside. It just loops traffic back to your machine.

✅ **Analogy:** It’s like bouncing a ball off a wall — it goes out and comes right back.

Also, not just 127.0.0.1, but the entire range from 127.0.0.1 to 127.255.255.255 is reserved for loopback. Though, we almost always just use 127.0.0.1.

</section>

<section id="can_we_change_name">

### 🛠 Can We Change the Name?

Yes, absolutely!You can **assign any custom name** to 127.0.0.1 in your host’s file. For example: `127.0.0.1 localhost prashant mytestsite devserver`

Now typing `prashant` or `devserver` in the browser (on your machine) will behave the same as `localhost`.

</section>

<section id="why_useful">

### Why Is Localhost Useful?

1.  **Testing & Development**
    You can build and test websites or APIs locally — no internet required.
    **Example:**

    * Run a local server (like Apache, Nginx, Node.js)

    * Visit `http://localhost:3000` to view your app

2.  **Security**
    Requests to localhost never leave your machine, making it great for safe testing.

3.  **Speed**
    It’s super-fast since nothing travels across the internet.

</section>

---

<section id="xampp_apache_php">

# 🧩 Why do we need XAMPP and Apache to run PHP on localhost?
- PHP is a server-side language, which means:
- It needs a web server (like Apache) to process the `.php` files.
- You can't just double-click a `.php` file or open it directly in the browser like an `.html` file.

#### That's where XAMPP comes in — it gives you:
- ✅ Apache Server (to serve files over HTTP)
- ✅ PHP engine (to interpret PHP code)
- ✅ MySQL (for database)

</section>

---

<section id="step_by_step_flow">

## ✅ Step-by-Step Flow: What Happens Under the Hood
### 🧱 1. You Start Apache in XAMPP
- This starts the Apache web server on your machine.
- It listens on port 80 (or 8080 if 80 is busy).
- It sets your machine ready to serve web pages via `http://localhost`.

### 🗂 2. You Put PHP File Inside htdocs
- Apache looks for files inside a folder called `htdocs` (hyper text documents) (in XAMPP’s install directory).
- Example: `C:\xampp\htdocs\myproject\index.php`
- Think of `htdocs` as the "root folder" (like `/var/www/html` on Linux Apache).

### 🌐 3. You Type `http://localhost/myproject/` in Browser
When you type this:
- The browser sends a request to Apache, which is running.
- Apache finds `index.php` inside `htdocs/myproject/`.
- Apache processes it using the built-in PHP interpreter.
- Apache sends the HTML output (from PHP) back to your browser.

> ✅ You see the result of your PHP code, even if it’s using logic, database, forms, etc.

</section>

---

<section id="cant_open_file_directly">

## 🧪 Why Can’t We Just Open the File Directly?
Let’s say you open this:

```plaintext
file:///C:/xampp/htdocs/myproject/index.php
```
- This just shows the raw PHP code in your browser.
- Because browsers don’t understand PHP, only web servers like Apache do.
- So you always need to access it through:
`http://localhost/...`
so Apache (with PHP) can parse and execute it.

</section>
