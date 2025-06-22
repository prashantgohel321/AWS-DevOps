# Linux Day 04 Networking Commands

### 🤔 What does a DevOps Engineer actually do daily?

- One of the most common tasks a DevOps engineer does is deploy applications on various servers or cloud systems.
- But what happens when an app doesn't run or respond after deployment?

That’s where basic **network troubleshooting** begins. And the first command in your toolbox is…

## List of Contents

* <a href="#day04_ping">01 `ping` – Check If Something is Alive on the Network</a>
* <a href="#day04_netstat">02 `netstat` – See What’s Happening in Your Network</a>
* <a href="#day04_ifconfig">03 `ifconfig` – Know Your Network Interfaces</a>
* <a href="#day04_traceroute_tracepath">04 `traceroute` vs `tracepath`: Follow the Journey of Your Network Request</a>
* <a href="#day04_mtr">05 `mtr` – My Traceroute (Ping + Traceroute Combined)</a>
* <a href="#day04_nslookup">06 `nslookup` – Find the IP Behind a Domain</a>
* <a href="#day04_telnet">07 `telnet` – Test Port Connectivity to a Server</a>
* <a href="#day04_hostname">08 `hostname` – Get or Set Your System's Name</a>
* <a href="#day04_ip_address_show">09 `ip address show` – Modern Alternative to ifconfig</a>
* <a href="#day04_iwconfig">10 `iwconfig` – Wireless Network Info</a>
* <a href="#day04_ss">11 `ss` – A Modern Replacement for netstat</a>
* <a href="#day04_dig">12 `dig` – Deep DNS Lookup</a>
* <a href="#day04_whois">13 `whois` – Domain Ownership & Registry Info</a>
* <a href="#day04_netcat">14 `nc` (Netcat) – The Network Swiss Army Knife</a>
* <a href="#day04_arp">15 `arp` – View ARP Table (Address Resolution Protocol)</a>
* <a href="#day04_ifplugstatus">16 `ifplugstatus` – Is Your Ethernet Plugged In?</a>
* <a href="#day04_curl">17 `curl` – Talk to APIs Like a DevOps Pro</a>
* <a href="#day04_wget">18 `wget`</a>
* <a href="#day04_iptables">19 `iptables` – Control Your Network Traffic</a>
* <a href="#day04_watch">20 `watch` – Repeatedly Run a Command (Live Monitoring)</a>
* <a href="#day04_nmap">21 `nmap` – Scan Networks Like a Pro</a>
* <a href="#day04_route">22 `route` – View or Edit Routing Table</a>
* <a href="#day04_summary_table">23 Final Recap Table</a>

---

<section id="day04_ping">

🔍 **`ping`** – Check If Something is Alive on the Network

Imagine this:
- You deploy your app, but it's not opening in the browser. First question in your mind is:

> “Is the server even reachable?”

To answer this, we use the ping command.

### 💡 What is ping?
ping checks whether a particular system (like a server or website) is reachable over the network.

It works like this:
- It sends small packets of data to the destination (IP address or domain).
- If the destination receives it, it sends back a reply.
- You get a result showing whether the system is reachable and how long it took for the round-trip.

So, if the ping is successful, it means:

- ✅ Your internet is working
- ✅ The target server is online
- ✅ Basic network communication is happening

If not, you know there’s a problem — either with your system, the server, or the internet connection.

🧪 Real Example
You want to check if your portfolio website is up and responding.

Just run:
```bash
ping portfolio.in
```

If everything’s good, you’ll see something like:
```
64 bytes from ...: icmp_seq=1 ttl=57 time=20.4 ms
```

That confirms:
- ✔️ The domain is reachable
- ✔️ The server is alive
- ✔️ There’s no network block

🛠️ When Should DevOps Use ping?
- App is not loading or giving connection errors
- To confirm server is up before SSH login
- To check internet connectivity
- To test if a DNS name resolves correctly
- First step in debugging downtime issues

</section>

<section id="day04_netstat">

### 🌐 `netstat` – See What’s Happening in Your Network

#### 🧰 First Things First: Install the Toolkit
The netstat command doesn’t come pre-installed in newer Linux distributions. It belongs to an older but very useful package called net-tools.

Install it first:
```bash
sudo apt install net-tools
```

Once installed, you're ready to use:
```bash
netstat
```

### 📊 What is netstat?
- netstat stands for Network Statistics.

- It gives you a snapshot of all network connections your system is handling — like who your machine is talking to, which ports are open, and which protocols are being used.

### 🧠 Why DevOps Engineers Use netstat
As a DevOps engineer, this command is super helpful when:
- You want to debug connection issues on your server
- You need to see if a specific port is open or in use
- You’re checking for suspicious or unexpected network activity
- You’re managing multiple services on a single machine (like on AWS EC2).


| Column        | Meaning                                   |
| :------------ | :---------------------------------------- |
| Proto         | Protocol (TCP/UDP) used for communication |
| Recv-Q        | Data received but not yet processed       |
| Send-Q        | Data waiting to be sent                   |
| Local Address | Your system’s IP and port                 |
| Foreign Address | The remote system it’s connected to       |
| State         | Connection state (e.g., LISTEN, ESTABLISHED, TIME_WAIT) |

### 🔌 Real-World Example: Using EC2
If you’re running an EC2 instance with multiple services (like web server, database, monitoring tools), you can use:

```bash
netstat -tuln
```

- This shows all TCP (-t) and UDP (-u) ports in a numeric (-n) format that are listening (-l).

Example output:

```bash
tcp         0      0 0.0.0.0:22          0.0.0.0:* LISTEN
tcp         0      0 0.0.0.0:80          0.0.0.0:* LISTEN
```

This tells you:
- Port 22 (SSH) is open
- Port 80 (HTTP) is open
- These are waiting for incoming connections

### 🧵 What’s a Socket?
> Think of a socket as a doorway between your app and the network.

Whenever two systems want to talk (like your browser talking to a web server), they connect using sockets.

Each socket includes:
- An IP address
- A port number
- A communication protocol (TCP/UDP)

If you're using an EC2 instance, every running service (like Apache, Nginx, MySQL) opens sockets to listen or communicate.

### 🛠 When to Use netstat?
- Check which ports are open on your system
- Find out which services are using specific ports
- Troubleshoot app not responding issues
- Check if a server is establishing outbound/inbound connections

</section>

---

<section id="day04_ifconfig">

### 🌐 `ifconfig` – Know Your Network Interfaces

#### 🧠 What is ifconfig?
- ifconfig stands for interface configuration.
- It’s used to view or configure network interfaces on a Linux system — kind of like looking under the hood to see how your system connects to the outside world.

to use it:
```bash
sudo apt install net-tools   # Only needed if not already installed
ifconfig
```

#### 📋 Output You'll See
When you run ifconfig, you’ll see output like this (simplified):

```bash
docker0: ...
eth0: ...
lo: ...
```

Let’s break these down:

#### 🔌 eth0 – Your Ethernet Interface
- eth0 is the wired network interface (Ethernet).
- If you're running a cloud server like EC2, it also uses a virtual version of this to connect to the internet.
- Under the hood, eth0 is connected to a NIC (Network Interface Card) — the physical (or virtual) device that allows your machine to connect to a network.

So if you see:
```bash
eth0: inet 172.31.22.45
```

It means your server has an IP address and is connected to a network using this interface.

#### 🌀 lo – The Loopback Interface (Localhost)
- lo stands for loopback — a special internal network interface.
- It lets your system talk to itself using the IP 127.0.0.1, also known as localhost.

Imagine you're testing a web app on your own laptop, like a React or Node.js project.

When you run:
```bash
npm start
```

You usually open the app in your browser at:
```bash
http://localhost:3000
```

This is powered by the loopback interface — no external network or internet needed.

Even if the machine has no internet, `lo` still works. It's used to test local services and servers.

#### 🐳 docker0 – The Docker Bridge Network
- If you’ve installed Docker, you’ll see an extra interface like docker0.
- This is a virtual network bridge Docker creates to let containers communicate with each other and with the host.
- So if you're running multiple containers, docker0 helps them talk — like a mini-internet just for your containers.

#### 🛠️ When to Use ifconfig as a DevOps Engineer?
- To check your server’s IP address
- To verify if a network interface is up or down
- To troubleshoot connectivity issues
- To view Docker network interfaces
- To check if your app is running on localhost

#### 💡 Quick Tip: Want a More Modern Tool?
Use:
```bash
ip a
```

This is the modern replacement for ifconfig and shows the same information in a slightly more detailed format.

</section>

---

<section id="day04_traceroute_tracepath">

### 🛰️ `traceroute` vs `tracepath`: Follow the Journey of Your Network Request

#### 🎥 How Do You Actually Watch a YouTube Video?
Let’s say you open YouTube in your browser. What happens behind the scenes?
- Your device sends a request to your ISP (Internet Service Provider).
- The ISP contacts a DNS server to translate youtube.com into an IP address.
- The request starts traveling from one server to another — hopping through various routers.
- Eventually, it reaches YouTube’s server, and the response (video data) travels back the same way.

This entire path — from your system to YouTube — is called the **network route**.

As a DevOps engineer, it’s important to understand this route, especially when diagnosing delays or connection failures. That's where tools like traceroute and tracepath come in.

#### 🔍 What is traceroute?
traceroute shows you the exact path your request takes to reach a destination — including every hop (server or router) it passes through.

It’s like a **Google Maps** for network traffic.

Each hop tells you:
- The IP of the router/server
- How long it took to reach there (latency)
- Where delays or failures might be happening

🔧 Install and Use traceroute:
```bash
sudo apt install traceroute

# sometimes it requires
sudo apt install inetutils-traceroute
```

Now trace a route to YouTube:
```bash
traceroute youtube.com
```

🔍 You'll see something like:
```bash
1   192.168.1.1   1.2 ms
2   100.72.0.1    5.4 ms
3   172.217.194.138   25.6 ms
```

Each line = one hop. It tells you how many stops your request makes before reaching the destination.

#### ❓ Interview Tip
> Q: If I give you a source and destination, how would you find all the IPs it goes through?

> A: You can use the traceroute command to see each hop between the source and destination.

#### 🔁 What is tracepath?
tracepath is similar to traceroute, but it:
- Doesn’t require root access
- Is often pre-installed in newer Linux systems
- Uses slightly different logic (UDP vs ICMP)

Run it like this:
```bash
tracepath youtube.com
```

You’ll get the same kind of output: a list of hops, with delay times.

📌 Main difference: tracepath is simpler, doesn't need installation in many distros, and avoids using low-level packet manipulation.


#### 👨‍💻 DevOps Use Cases
As a DevOps Engineer, you might use traceroute or tracepath to:
- Check where a network delay is happening
- Find how many routers a request goes through
- Debug slow API or application response time
- Identify if a server is stuck behind a slow hop

| Command   | Use Case                       | Needs sudo? | Notes                                  |
| :-------- | :----------------------------- | :---------- | :------------------------------------- |
| traceroute | Shows full route to destination | Yes         | More detailed, needs install           |
| tracepath | Same, but no root needed       | No          | Often pre-installed, simpler           |

</section>

---

<section id="day04_mtr">

### `mtr` – My Traceroute (Ping + Traceroute Combined)

#### 💡 What is mtr?
mtr is a powerful network diagnostic tool that combines the features of both ping and traceroute. It gives you a live, real-time view of the path your packets take to a destination.

> No need to run ping and traceroute separately — mtr does both in one go.

🔧 Install & Use:
```bash
sudo apt install mtr
mtr youtube.com
```

It starts by pinging the destination, then gradually shows you each hop, along with:
- Response times
- Packet loss
- Stability of the route

#### 🧠 DevOps Tip:
Use mtr when:
- You want a real-time report of network stability
- You're debugging intermittent or flaky network issues

</section>

<section id="day04_nslookup">

### `nslookup` – Find the IP Behind a Domain

#### 🔎 What is nslookup?
nslookup (Name Server Lookup) is used to:
- Check if a domain name is resolving correctly
- View the public IP address associated with a domain
- Test if your DNS is working

🛠️ Usage:
```bash
nslookup youtube.com
```

You’ll see:
- The server that resolved your query
- The IP address of the domain (public IP)
- Sometimes additional DNS records (like MX, CNAME if specified)

#### ✅ Why DevOps Engineers Use It:
- To verify domain resolution (especially after DNS updates)
- To troubleshoot DNS-related issues
- To confirm a service is pointing to the correct IP

</section>

----

<section id="day04_telnet">

### `telnet` – Test Port Connectivity to a Server
#### 🧠 What is telnet?
telnet is used to test connectivity to a specific port on a remote system.

Think of it as:
- "Can I connect to this IP/domain on this port?"
- This is super useful when debugging:
- Web servers (port 80 or 443)
- Database servers
- APIs or microservices

#### 🔧 Usage:
```bash
telnet youtube.com 80    # HTTP (public)
telnet youtube.com 443    # HTTPS (secure)
```

If the port is open and reachable, you’ll connect. If not, it’ll fail — letting you know something is blocked (firewall, port closed, etc).

#### 📌 DevOps Use Case:
- Confirm if a service is up and listening on a certain port
- Debug network/firewall rules in cloud environments
- Validate microservices communication in private networks

</section>

---

<section id="day04_hostname">

#### `hostname` – Get or Set Your System's Name
#### 🖥️ What is hostname?
The hostname command shows the name of your system in the network. This is what other systems might see when they interact with yours.

#### Usage:
```bash
hostname          # See your system name
sudo hostname Prashant  # Temporarily change your hostname
```

Note: This change lasts until reboot. For permanent change, you modify system config files like /etc/hostname.

#### 🔧 DevOps Use Case:
- Identify machines in a multi-server setup
- Temporarily rename instances during deployment or testing
- Helps in system logs, SSH access, and monitoring

#### Recap Commands
| Command    | Purpose                               | Example Use               |
| :--------- | :------------------------------------ | :------------------------ |
| mtr        | Live ping + traceroute                | `mtr google.com`          |
| nslookup   | Check domain-to-IP resolution         | `nslookup example.com`    |
| telnet     | Test connectivity to a specific port  | `telnet server.com 443`   |
| hostname   | View or change system name            | `sudo hostname DevOpsMachine` |

</section>

---

<section id="day04_ip_address_show">

### `ip address show` – Modern Alternative to ifconfig

```bash
ip address show
```

or simply:
```bash
ip a
```

#### 🔍 This command displays:
- All available network interfaces
- Their IP addresses
- Whether the interface is up or down

#### 🧠 Why use it?
- It’s part of the modern iproute2 toolkit.
- Replaces ifconfig, which is considered outdated.
>Use this to check your server’s IP address, network adapter status, or troubleshoot connectivity.

</section>

---

<section id="day04_iwconfig">

### `iwconfig` – Wireless Network Info
```bash
sudo apt install wireless-tools
iwconfig
```

📡 This command shows wireless network interfaces and their settings, such as:
- Wi-Fi SSID
- Signal strength
- Bit rate
- Frequency/channel

🧠 Useful when working on laptops, IoT devices, Raspberry Pi, or any Linux box with Wi-Fi.

</section>

---

<section id="day04_ss">

### `ss` – A Modern Replacement for netstat
```bash
ss -tuln
```

- ✅ ss stands for Socket Statistics.

It’s faster and more accurate than netstat and shows:
- Listening ports
- Open connections
- Protocols in use (TCP/UDP)

#### 🧠 DevOps Use Case:
Use ss to debug which service is running on which port — especially when netstat isn’t available.

</section>

---

<section id="day04_dig">

### `dig` – Deep DNS Lookup
```bash
dig youtube.com
```

> 🧪 dig stands for Domain Information Groper.


It gives detailed DNS info, including:
- IP addresses (A records)
- Name servers
- TTL (Time to Live)
- DNS query times

#### 🧠 DevOps Use Case:
- Troubleshoot DNS issues
- Compare response from different DNS servers
- Check propagation of DNS changes

</section>

---

<section id="day04_whois">

### `whois` – Domain Ownership & Registry Info
```bash
sudo apt install whois
whois youtube.com
```

>🔎 whois reveals who owns a domain, when it was registered, when it expires, and where it's hosted.

🧠 Use it for:
- Domain-related investigations
- Checking if a domain is about to expire
- Security audits or asset discovery

</section>

---

<section id="day04_netcat">

### `nc` (Netcat) – The Network Swiss Army Knife

```bash
nc -zv example.com 80
```

🛠️ nc can:
- Test open ports
- Create TCP/UDP connections
- Transfer files
- Even run a basic server!

#### 🔍 Example: Check if a port is open
```bash
nc -zv google.com 443
```

#### 🧠 DevOps Use Case:
- Test network connectivity between services
- Simulate simple client-server behavior
- File transfer over internal network

</section>

<section id="day04_arp">

### `arp` – View ARP Table (Address Resolution Protocol)
```bash
arp -a
```

📄 Shows the list of IP-to-MAC address mappings that your machine has cached.

#### 🧠 Helpful when:
- Debugging local network issues
- Detecting devices connected to the same subnet
- Investigating spoofing or IP conflicts

</section>

---

<section id="day04_ifplugstatus">

### `ifplugstatus` – Is Your Ethernet Plugged In?
```bash
sudo apt install ifplugd
ifplugstatus
```

>🔌 This tells you whether your network cable (ethernet) is physically connected or not.

🧠 Useful for:
- Troubleshooting "no internet" on desktops or servers
- Quickly checking cable disconnection issues
- Network health checks

</section>

---

<section id="day04_curl">

### `curl` – Talk to APIs Like a DevOps Pro
#### 💬 What is an API?
Imagine you're in a restaurant. You don’t walk into the kitchen to get your food — you tell the waiter, and the waiter brings your food.

The waiter is like an API.

> You → API → Server → API → You (response)

### 📡 What is curl?
curl lets you talk to servers using APIs — to get data, send data, or trigger actions.

```bash
curl -X GET [https://api.example.com/users](https://api.example.com/users)
```

🧪 Want clean, readable output?

Install and use jq (JSON prettifier):

```bash
sudo apt install jq
curl -X GET [https://api.example.com/users](https://api.example.com/users) | jq
```

🧠 DevOps Use Cases:
- Test API endpoints
- Fetch configuration/data from services
- Automate deployment & monitoring tools

</section>

---

<section id="day04_wget">

### 🧲 What is wget?
```bash
wget [https://example.com/file.zip](https://example.com/file.zip)
```

📥 wget is used to download files from the internet via a direct link (HTTP/HTTPS/FTP).

🧠 DevOps Use Cases:
- Download source code, scripts, or configs from URLs
- Fetch release files during CI/CD pipeline runs

</section>

---

<section id="day04_iptables">

### `iptables` – Control Your Network Traffic
iptables is a powerful tool to manage firewall rules in Linux. It’s like a security gate that controls:
- Which connections are allowed
- Which ports/services are open
- Which traffic to block

```bash
sudo iptables -h          # Help
sudo iptables --list-rules    # View current rules
```

#### 🧠 What is a Routing Table?
A routing table is a set of rules that decides where your network traffic should go — kind of like Google Maps for your packets.

#### 🧠 DevOps Use Cases:
- Restrict incoming traffic on specific ports
- Allow only internal services to communicate
- Secure server access in production

</section>

---

<section id="day04_watch">

### `watch` – Repeatedly Run a Command (Live Monitoring)
```bash
watch mtr youtube.com          # Runs every 2 sec (default)
watch -n 5 mtr youtube.com     # Every 5 seconds
```

📺 watch runs a command again and again — refreshing the output in real time.

🧠 DevOps Use Cases:
- Monitor CPU/memory/disk/network usage
- Watch logs or API responses
- Debug real-time changes

</section>

---

<section id="day04_nmap">

### `nmap` – Scan Networks Like a Pro
```bash
sudo apt install nmap
nmap example.com
```

🛰️ nmap (Network Mapper) scans remote systems to:
- Discover open ports
- Find running services
- Detect operating systems

🔍 It’s like a network X-ray tool for security audits and diagnostics.

🧠 DevOps Use Cases:
- Audit open ports on cloud servers
- Check exposed services
- Validate firewall and network rules

</section>

---

<section id="day04_route">

### `route` – View or Edit Routing Table

```bash
route -n
```

📌 route shows or modifies your system’s routing table, which tells your machine how to send traffic based on destination.

🧠 DevOps Use Cases:
- Diagnose “no internet” problems
- Configure routing rules for VPN or internal network

> ⚠️ route is older — ip route is now preferred:

```bash
ip route show
```

</section>

---

<section id="day04_summary_table">

## ✅ Final Recap Table
| Command       | Purpose                                   | Notes                                  |
| :------------ | :---------------------------------------- | :------------------------------------- |
| `ip a`        | Show IP and interface status              | Modern `ifconfig`                      |
| `iwconfig`    | Show Wi-Fi interfaces                     | Requires wireless-tools                |
| `ss`          | Show open ports, connections              | Faster than `netstat`                  |
| `dig`         | Deep DNS lookup                           | For checking DNS records               |
| `whois`       | Domain ownership & registry info          | Good for audits & investigations       |
| `nc`          | Network utility for port check, transfer, TCP tests | Swiss army knife for networking        |
| `arp`         | IP-MAC mapping table                      | Useful in local networks               |
| `ifplugstatus` | Check if ethernet cable is plugged in     | Great for quick hardware checks        |

| Command    | Purpose                                     | Common Use                 |
| :-------- | :------------------------------------------ | :------------------------- |
| `curl`    | Talk to APIs, get or send data              | API testing                |
| `wget`    | Download files via URL                      | Automation                 |
| `iptables` | Set firewall/network rules                  | Security                   |
| `watch`   | Repeat a command every X seconds            | Monitoring                 |
| `nmap`    | Scan systems for open ports and services    | Audit                      |
| `route`   | Show routing rules (replaced by `ip route`) | Network                    |

</section>
