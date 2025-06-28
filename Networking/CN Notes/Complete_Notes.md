# 🌐 Computer Networking (CN)

## List of Contents
* <a href="#cn_what_is">01 What is Computer Networking?</a>
* <a href="#cn_why_devops_matters">02 Why Networking Matters in DevOps?</a>
* <a href="#cn_how_internet_works">03 How Does the Internet Work?</a>
    * <a href="#cn_internet_journey">03.01 Step-by-Step Internet Journey</a>
* <a href="#cn_practical_commands">04 Try It Yourself (Practical Commands)</a>
    * <a href="#cn_trace_route">04.01 Trace the Route</a>
    * <a href="#cn_check_connection">04.02 Check Connection</a>
* <a href="#osi_model">05 The OSI Model</a>
    * <a href="#osi_analogy">05.01 Imagine This:</a>
    * <a href="#osi_mnemonic">05.02 OSI Layers Mnemonic:</a>
    * <a href="#osi_layer7">05.03 Layer 7: Application Layer – “Let’s Play!”</a>
    * <a href="#osi_layer6">05.04 Layer 6: Presentation Layer – “Graphics, Sounds, and Security”</a>
    * <a href="#osi_layer5">05.05 Layer 5: Session Layer – “Let’s Connect”</a>
    * <a href="#osi_layer4">05.06 Layer 4: Transport Layer – “Send It Reliably”</a>
    * <a href="#osi_layer3">05.07 Layer 3: Network Layer – “Find the Way”</a>
    * <a href="#osi_layer2">05.08 Layer 2: Data Link Layer – “Local Delivery”</a>
    * <a href="#osi_layer1">05.09 Layer 1: Physical Layer – “The Real Wires”</a>
    * <a href="#osi_software_hardware">05.10 Software vs Hardware in OSI Model</a>
    * <a href="#osi_summary_gaming">05.11 Final Summary: Gaming the OSI Model</a>
    * <a href="#osi_ready_for_devops">05.12 Ready for DevOps?</a>
* <a href="#tcp_ip_model">06 TCP/IP Reference Model</a>
    * <a href="#tcp_ip_what_is">06.01 What is the TCP/IP Model?</a>
    * <a href="#tcp_ip_osi_comparison">06.02 TCP/IP vs OSI – Layer Comparison Table</a>
    * <a href="#tcp_ip_layer_explanation">06.03 Layer-by-Layer Explanation</a>
        * <a href="#tcp_ip_app_layer">06.03.01 1. Application Layer (User’s World 🌐)</a>
        * <a href="#tcp_ip_transport_layer">06.03.02 2. Transport Layer (Data Delivery 📦)</a>
        * <a href="#tcp_ip_internet_layer">06.03.03 3. Internet Layer (IP & Routing 🌍)</a>
        * <a href="#tcp_ip_network_access_layer">06.03.04 4. Network Access Layer (Local Network Transfer 🧱)</a>
    * <a href="#tcp_ip_end_to_end_flow">06.04 End-to-End Flow Example</a>
    * <a href="#tcp_ip_final_tip">06.05 Final Tip for DevOps Learners</a>
* <a href="#ip_address_subnets">07 IP Address & Subnets</a>
    * <a href="#ip_address_what_is">07.01 What is an IP Address?</a>
    * <a href="#ip_address_why_needed">07.02 Why Do Devices Need IP Addresses?</a>
    * <a href="#ip_address_versions">07.03 Types of IP Address Versions</a>
    * <a href="#ip_address_ipv4_problem">07.04 So What’s the Problem With IPv4?</a>
    * <a href="#ip_address_solution">07.05 What’s the Solution? – Subnets & Private IPs</a>
    * <a href="#ip_address_subnet_what_is">07.06 What is a Subnet?</a>
    * <a href="#ip_address_breakdown">07.07 IP Address Breakdown – Subnet Example</a>
    * <a href="#ip_address_summary">07.08 Final Summary (IP Address & Subnets)</a>
    * <a href="#ip_address_devops_use">07.09 As a DevOps Engineer, You’ll Use:</a>
* <a href="#aws_networking_essentials">08 AWS Networking Essentials: VPC, Subnets, Security Groups, NAT & DNS</a>
    * <a href="#aws_vpc_what_is">08.01 What is a VPC?</a>
    * <a href="#aws_vpc_structure">08.02 VPC Structure Breakdown</a>
    * <a href="#aws_ip_addressing_vpc">08.03 IP Addressing Inside VPC</a>
    * <a href="#aws_security_group">08.04 What is a Security Group (SG)?</a>
    * <a href="#aws_sg_example">08.05 Example: Allow Only Your PC to SSH</a>
    * <a href="#aws_connecting_ec2_public_ip">08.06 Connecting to EC2 Using Public IP</a>
    * <a href="#aws_webpage_hosting">08.07 Live Webpage Hosting on EC2 (Ubuntu)</a>
    * <a href="#aws_firewall_blocking">08.08 Can’t Access Page? Firewall (SG) is Blocking</a>
    * <a href="#aws_nat">08.09 What is NAT?</a>
    * <a href="#aws_dns">08.10 DNS: Domain Instead of IP</a>
    * <a href="#aws_osi_behind_scenes">08.11 OSI Model Behind the Scenes (Quick Review)</a>
    * <a href="#aws_networking_summary">08.12 Summary (AWS Networking)</a>
* <a href="#aws_vpc_networking">09 AWS VPC Networking – Subnets, NAT, Gateways, and Route Tables</a>
    * <a href="#aws_vpc_cli_commands">09.01 First, Some Handy CLI Commands</a>
    * <a href="#aws_vpc_what_is_detailed">09.02 What is a VPC (Virtual Private Cloud)?</a>
    * <a href="#aws_vpc_db_placement">09.03 Where to Keep Your Database?</a>
    * <a href="#aws_vpc_app_db_talk">09.04 How App (Public Subnet) Talks to DB (Private Subnet)?</a>
    * <a href="#aws_vpc_user_access">09.05 But... How Does a User Access My App?</a>
    * <a href="#aws_vpc_route_table">09.06 What is a Route Table in VPC?</a>
    * <a href="#aws_vpc_full_traffic_flow">09.07 Full Traffic Flow: End-to-End Example</a>
    * <a href="#aws_vpc_peering">09.08 Bonus: VPC Peering</a>
    * <a href="#aws_vpc_summary_table">09.09 Summary Table (AWS VPC Networking)</a>
* <a href="#load_balancer">10 What is a Load Balancer? – With AWS Perspective</a>
    * <a href="#load_balancer_basic_idea">10.01 Basic Idea:</a>
    * <a href="#load_balancer_types">10.02 Types of Load Balancers in AWS</a>
        * <a href="#load_balancer_alb">10.02.01 1. Application Load Balancer (ALB)</a>
        * <a href="#load_balancer_nlb">10.02.02 2. Network Load Balancer (NLB)</a>
        * <a href="#load_balancer_gwlb">10.02.03 3. Gateway Load Balancer (GWLB)</a>
    * <a href="#load_balancer_aws_architecture">10.03 How Load Balancers Fit in AWS Architecture</a>
    * <a href="#load_balancer_alb_nlb_comparison">10.04 Layer Comparison: ALB vs NLB</a>
    * <a href="#load_balancer_devops_relevance">10.05 Real-World DevOps Relevance</a>
    * <a href="#load_balancer_quick_setup">10.06 Quick Setup Steps (ALB):</a>

---

<br>
<br>

<section id="cn_what_is">

## 🧠 What is Computer Networking?
Let’s imagine this:
- There are 5 cities — C1, C2, C3, C4, and C5.
- These cities are connected by roads.
- You can travel between cities using a car.

Now, imagine:
- Cities = Computers
- Roads = Network
- Car = Data

<br>

> ➡️ So, Computer Networking is like building roads between cities so that cars (data) can travel from one city (computer) to another.

In simple terms:
> Computer Networking is a system where multiple computers are connected to share data, files, and resources like printers or the internet — either via wires (cables) or wireless means.

</section>

---

<br>
<br>

<section id="cn_why_devops_matters">

## 🤔 Why Networking Matters in DevOps?

As a DevOps Engineer, your job involves working with servers, cloud systems, and automations.

### 🧰 So why is networking important?

- You often transfer files between servers.

- You need to configure firewalls, load balancers, DNS records, and monitor traffic.

- You might have to SSH into a remote machine, which is part of a network.

In short, you can’t do DevOps without a good grip on networking.

</section>

---

<br>
<br>

<section id="cn_how_internet_works">

## 🌍 How Does the Internet Work?

Let’s make this super simple:

🎬 **Example**: You’re watching Netflix in India
But Netflix's main servers are in the USA.
So how does your request reach them?

You might imagine that data travels through satellites. Yes, that’s possible, but it’s slow due to the distance.

✅ Real Answer: Undersea Optical Fiber Cables
Oceans are filled with underwater fiber cables — these cables carry data at high speed and low latency.

So when you visit www.netflix.com, here’s what happens:

</section>

<section id="cn_internet_journey">
<br>

## 🌐 Step-by-Step Internet Journey

- You type a website (e.g., www.netflix.com) in the browser.

- The request goes out using a protocol: HTTP or HTTPS.

> HTTP (HyperText Transfer Protocol) sends webpages.

> HTTPS is the secure version (with encryption).

### But… how will the internet know where Netflix is?

That’s where DNS (Domain Name System) comes in.

**🔎 DNS works like a phonebook**:

- You ask it: “Where is www.netflix.com?”
- It replies: “Here’s the IP address: 198.123.45.67.”
- 🌐 The IP address is where Netflix's server lives — in the USA.
- Your request travels through routers, ISPs, and cables...

Your Device → Router → ISP (like Jio, Airtel) → Submarine Cables → Netflix Server

Netflix sends video data back the same way to your browser — and voilà, your movie starts!

</section>

---

<section id="cn_practical_commands">

## 🔧 Try It Yourself (Practical Commands)

<section id="cn_trace_route">

### 🔍 Trace the Route

See how your request travels across the internet:
```bash
traceroute netflix.com      # On Linux/macOS
tracert netflix.com         # On Windows
```

This will show:
- Your router’s IP
- ISP nodes
- International jumps
- And finally, the destination (Netflix)

</section>

<section id="cn_check_connection">

### 📶 Check Connection
Use ping to see if you can reach a server:
```bash
ping google.com
```
It sends small packets to Google and shows if it’s reachable and how long it takes (latency).

</section>
</section>

---

<br>
<br>

<section id="osi_model">

## 🧠 The OSI Model

OSI (Open Systems Interconnection) Model is a framework that standardizes how data is transferred between two systems over a network.

It has 7 layers, each with a specific role in ensuring smooth, secure, and reliable communication.

</section>

<section id="osi_analogy">

### 🎮 Imagine This:
Two friends, A and B, are playing a multiplayer online game from different countries.

Let’s use this scenario to understand how the OSI Model works.

</section>

<section id="osi_mnemonic">

### 📚 OSI Layers Mnemonic:

**A**ll **P**eople **S**eem **T**o **N**eed **D**ata **P**rocessing

(Application → Physical)

</section>

---

<section id="osi_layer7">

### 🔼 Layer 7: Application Layer – “Let’s Play!”
This is where A and B run the actual game app (e.g., PUBG, Fortnite).

- This is the **interface** between the user and the network.

- They use a browser or mobile app.

- Protocols: HTTP, HTTPS, FTP, SMTP

> 💡 In DevOps, you work with these protocols while managing servers and web apps.

</section>

---

<section id="osi_layer6">

### 🎨 Layer 6: Presentation Layer – “Graphics, Sounds, and Security”
A and B are seeing graphics, using keyboard, listening to game sounds, and the data is encrypted.

- It manages how the data is presented: format, encoding, encryption.

- It converts data to be readable by the receiver.

- Also responsible for SSL/TLS encryption (important in HTTPS).

> 🛡️ Think of this as the syntax and security formatting of the data.

</section>

---

<section id="osi_layer5">

### 🔌 Layer 5: Session Layer – “Let’s Connect”
Before playing, a connection is established between A and B (like a game lobby).

- This layer establishes, maintains, and ends communication sessions.

- Responsible for authentication and session management.

#### 🔧 Examples:

**API sessions**: when apps talk to each other (e.g., payment gateways).

**Sockets**: used for real-time communication like chat, games, etc.

> 👉 API: Bridge between two apps (e.g., Google Maps inside Zomato app)

> 👉 Socket: Real-time data channel (e.g., online multiplayer game, live chat)

</section>

---

<section id="osi_layer4">

### 📦 Layer 4: Transport Layer – “Send It Reliably”
The game data like movements, actions, chat is now broken into packets and sent between A and B.

- Responsible for reliable delivery, error checking, and flow control.

#### Protocols:

**TCP (Transmission Control Protocol)** – Reliable, connection-based

**UDP (User Datagram Protocol)** – Faster but no guarantee (used in live games, video calls)

> 🧪 You’ll hear this in DevOps when setting up ports, firewalls, or troubleshooting connection issues.

</section>

---

<section id="osi_layer3">

### 🛰️ Layer 3: Network Layer – “Find the Way”
A and B’s data has to travel across the globe. So it needs routing.

- Responsible for IP addressing and routing.

- It finds the best path for data.

#### Protocol: IP (Internet Protocol)

> 📍 Example: Your request goes from India to the US via routers using IPs.

You can trace this using:

```bash
traceroute google.com   # Linux/macOS
tracert google.com      # Windows
```

</section>

---

<section id="osi_layer2">

### 🔗 Layer 2: Data Link Layer – “Local Delivery”
Now the data is being transferred within the same local network (e.g., from your laptop to your WiFi router).

- Deals with MAC addresses, frames, and error detection.

- Ensures data is sent to the right device on a local network.

👀 You can check your MAC address using:

```bash
ip link show
```

</section>

---

<section id="osi_layer1">

### 🧱 Layer 1: Physical Layer – “The Real Wires”
Finally, all of this data flows through real hardware – like fiber optic cables, network cards, or WiFi signals.

- Transmits 0s and 1s (binary data) over physical medium (cables, radio waves).

#### Includes: Cables, Switches, Hubs, Connectors, NICs.

> 💡 Without this, the internet wouldn’t exist physically.

</section>

---

<section id="osi_software_hardware">

### 🔄 Software vs Hardware in OSI Model
| Layer                      | Handled By                       |
| ---------------------------- | -------------------------------------- |
| Application to Session (7–5) | **Software** (Apps, APIs, OS services) |
| Transport to Physical (4–1)  | **Hardware + OS + Network tools** |

</section>

---

<section id="osi_summary_gaming">

## 🧵 Final Summary: Gaming the OSI Model

| Layer           | Game Analogy        | Real Function                    |
| --------------- | --------------------- | -------------------------------- |
| 7. Application  | Running the Game      | Interface for user apps          |
| 6. Presentation | Graphics & Encryption | Data formatting, encryption      |
| 5. Session      | Connection Setup      | Session control (API/Sockets)    |
| 4. Transport    | Sending Actions       | Reliable data delivery (TCP/UDP) |
| 3. Network      | Global Routing        | IP addressing and routing        |
| 2. Data Link    | Local Network         | MAC address & local delivery     |
| 1. Physical     | Hardware/Signals      | Cables, NICs, electrical signals |

</section>

---

<section id="osi_ready_for_devops">

### ✅ Ready for DevOps?
OSI is more than theory. You’ll use it when:

- Configuring ports (Layer 4)

- Understanding IP routing and DNS (Layer 3)

- Managing VPNs and proxies

- Debugging with ping, traceroute, netstat, tcpdump, etc.

</section>

---

<br>

<br>

<section id="tcp_ip_model">

# 🌐 TCP/IP Reference Model

<section id="tcp_ip_what_is">

## ✅ What is the TCP/IP Model?
The TCP/IP Model **(Transmission Control Protocol / Internet Protocol)** is the framework used in real-world networks, including the internet.

🧠 Fun Fact:

- It was developed by the U.S. Department of Defense.

- It’s more practical than OSI.

- The entire internet works using this model!

</section>

---

<br>

<section id="tcp_ip_osi_comparison">

### 🔢 TCP/IP vs OSI – Layer Comparison Table

| TCP/IP Model          | OSI Model                        | Description                                      |
| --------------------- | -------------------------------------- | ------------------------------------------------ |
| 4️⃣ Application Layer | OSI Layers 7, 6, 5 (App, Pres, Sess)   | User-facing services like HTTP, FTP, DNS         |
| 3️⃣ Transport Layer   | OSI Layer 4 (Transport)                | Ensures data delivery (TCP/UDP)                  |
| 2️⃣ Internet Layer    | OSI Layer 3 (Network)                  | IP addressing and routing                        |
| 1️⃣ Network Access    | OSI Layers 2 & 1 (Data Link, Physical) | Deals with MAC, switches, physical data transfer |

</section>

---

<br>

<section id="tcp_ip_layer_explanation">

## 🔍 Layer-by-Layer Explanation

<section id="tcp_ip_app_layer">

### 🔼 1. Application Layer (User’s World 🌐)
- Combines Application + Presentation + Session (from OSI)

- This layer is where users interact — web apps, emails, file transfers, etc.

#### 🛠️ Protocols:

- HTTP/HTTPS – Browsing websites

- FTP – File transfers

- SMTP/POP3/IMAP – Emails

- DNS – Resolving domain names

- SSH – Securely accessing remote machines

#### 💡 DevOps relevance:

- You deploy web apps via HTTP

- Use DNS to map domains

- Use SSH daily to connect to servers

</section>

---

<br>

<section id="tcp_ip_transport_layer">

### 🚚 2. Transport Layer (Data Delivery 📦)
- Same as OSI Layer 4

- This layer is responsible for reliable or fast delivery of data between systems.

#### 🛠️ Protocols:

- TCP – Reliable, ordered, connection-based

- UDP – Fast, connectionless (e.g., video calls, gaming)

#### 💡 DevOps relevance:

- Use TCP for SSH, HTTPS, etc.

- Understand port numbers (like 80 for HTTP, 443 for HTTPS)

- Configure firewalls and load balancers on this layer

</section>

---

<br>

<section id="tcp_ip_internet_layer">

### 🛰️ 3. Internet Layer (IP & Routing 🌍)
- Matches OSI’s Network Layer

- This layer decides how to send data from one device to another across networks.

#### 🛠️ Protocols:

- IP (Internet Protocol) – Assigns addresses

- ICMP – For diagnostics (used by ping)

- ARP – Finds MAC address from IP

- RIP/OSPF/BGP – Routing protocols

#### 💡 DevOps relevance:

- IP configuration, subnetting

- ping, traceroute, netstat, and ip commands

- Setting up routing between VPCs in AWS

</section>

---

<section id="tcp_ip_network_access_layer">

### 🔌 4. Network Access Layer (Local Network Transfer 🧱)
- Combines OSI Layers: Data Link + Physical

- Handles local delivery within the same network — like your PC to WiFi router.

#### 🛠️ Technologies:

- Ethernet, Wi-Fi

- Switches, Cables, Network Interface Cards (NIC)

- MAC addresses

#### 💡 DevOps relevance:

- Identify NICs

- Work with MAC/IP mapping

- Monitor hardware-based issues

</section>
</section>

---

<br>

<section id="tcp_ip_end_to_end_flow">

## 🔁 End-to-End Flow Example
🧑‍💻 User A wants to open www.example.com
- Application Layer: Browser sends HTTP request

- Transport Layer: Data broken into TCP segments

- Internet Layer: Adds IP header to route packets

- Network Access Layer: Frames sent via Ethernet/Wi-Fi to local router

</section>

---

<br>

<section id="tcp_ip_final_tip">

## 🚀 Final Tip for DevOps Learners
Think of the TCP/IP model not just as theory, but as a troubleshooting tool.

If something goes wrong:

- Is the domain not resolving? → DNS issue (Application layer)

- Can’t connect to server? → Port or firewall (Transport layer)

- Packet not reaching? → Routing (Internet layer)

- No connection at all? → Cable/Wi-Fi issue (Network Access layer)

</section>

---
<br>
<br>
<section id="ip_address_subnets">

# 🌐 IP Address & Subnets

<section id="ip_address_what_is">

## 📦 What is an IP Address?
- Imagine your device (laptop, phone, etc.) as a house, and the internet is the global postal service.

- Just like each house needs a unique address to receive letters,
every device needs a unique IP address to send and receive data.

### 🧠 Definition:
- An IP address (Internet Protocol address) is a unique identifier assigned to a device connected to a network so it can communicate with other devices.

</section>

---

<br>

<section id="ip_address_why_needed">

# 🖥️ Why Do Devices Need IP Addresses?
Today, we have a variety of smart devices:
- 📱 Smartphones

- 💻 Laptops

- 📺 Smart TVs

- ⌚ Smartwatches

- 📟 Tablets

➡️ Each of them must be uniquely identifiable on the internet or local network.
Without an IP address, the internet won’t know where to send the data.

> 📬 IP = Digital Home Address for devices <br>
Used by the TCP/IP model (real-world) and also fits into OSI Layer 3 (Network Layer)

</section>

---

<br>

<section id="ip_address_versions">

## 🧮 Types of IP Address Versions
### 📄 IPv4 – Internet Protocol Version 4
- Format: `192.168.1.1`

- Uses 32 bits = ~4.2 billion addresses

- ✅ Widely used today

- ❌ Problem: Not enough IPs for all devices on Earth

### 🌍 IPv6 – Internet Protocol Version 6
- Format: `2001:0db8:85a3:0000:0000:8a2e:0370:7334`

- Uses 128 bits = 340 undecillion IPs (massive!)

- ✅ Solves the address limitation

- ❌ Still not adopted fully everywhere (IPv4 still dominates)

</section>

---

<br>

<section id="ip_address_ipv4_problem">

## 🤯 So What’s the Problem With IPv4?
There are only about 4.2 billion IPv4 addresses.
But with billions of people and multiple devices per person, we ran out fast!

Imagine if every device needed a real internet-facing IP, we’d have been done by now!

</section>

---

<section id="ip_address_solution">

## 💡 What’s the Solution? – Subnets & Private IPs

### 🌐 Solution 1: Private Networks + Subnets
Instead of creating one massive internet, we create many small internal networks (like mini-internets).

Each internal network can reuse private IP addresses (like `192.168.x.x`, `10.x.x.x`, etc.) behind a router or firewall using NAT (Network Address Translation).

These internal networks are called subnets.

</section>

---

<br>

<section id="ip_address_subnet_what_is">

## 🧩 What is a Subnet?
A subnet (sub-network) is a smaller section of a larger network — like rooms in a house.

By dividing a large network into subnets:
- Devices stay organized

- Traffic is more efficient

- IP addresses are reused smartly


💡 In DevOps & Cloud:
- You’ll often create subnets in AWS VPCs

- You’ll assign private IPs and control traffic between them

</section>

---

<section id="ip_address_breakdown">

## 🔢 IP Address Breakdown – Subnet Example
Let’s say:

```yaml
IP: 192.168.10.5
Subnet Mask: 255.255.255.0

Network part: 192.168.10
Host part: .5 (device number in network)
```
This means:
- All devices in `192.168.10.X` belong to the same subnet

- The `.5` is the unique address within that subnet

</section>

---

<br>

<section id="ip_address_summary">

## ✅ Final Summary
| Term        | Meaning                                                              |
| ----------- | -------------------------------------------------------------------- |
| IP Address  | Unique number to identify a device on a network                      |
| IPv4        | Older version, 32-bit, ~4.2 billion addresses (e.g., `192.168.1.1`) |
| IPv6        | Newer version, 128-bit, 340 undecillion addresses                    |
| Subnet      | A logical division of a large network                                |
| NAT         | Allows many private IPs to use one public IP for internet access     |
| Private IPs | Used inside local networks (not directly reachable from internet)    |

</section>

---

<br>

<section id="ip_address_devops_use">

## 👨‍💻 As a DevOps Engineer, You’ll Use:
- Private/Public IPs when deploying servers

- Subnets when setting up cloud networks (like AWS VPC)

- CIDR notation for subnetting (e.g., `10.0.0.0/24`)

- `ping`, `ip addr`, `ifconfig`, `ipcalc`, etc. to manage networks

</section>

---

<section id="aws_networking_essentials">

# ☁️ AWS Networking Essentials: VPC, Subnets, Security Groups, NAT & DNS

<section id="aws_vpc_what_is">

## 🧠 What is a VPC?
- VPC (Virtual Private Cloud) is like your own private network inside AWS.

- Imagine AWS as a huge city 🏙️, and you get your own private colony inside it. That’s a VPC.

### 🔑 Key Points:
- You control IP ranges, subnets, routing, and firewall rules.

- VPCs are isolated, so IPs won’t clash between users.

- Each EC2 instance you launch lives inside a subnet → inside a VPC.

</section>

---

<section id="aws_vpc_structure">

## 🧩 VPC Structure Breakdown
```scss
Copy
Edit
🌐 AWS Cloud
    └── VPC (Your Private Network)
        └── Subnets (Smaller segmented networks: Public & Private)
            └── EC2 Instances (Virtual Machines)
```

➡️ You can have multiple subnets within a VPC — think of them as rooms in your house.

</section>

<section id="aws_ip_addressing_vpc">

## 🌍 IP Addressing Inside VPC
- Every device (EC2 instance) inside a VPC gets a unique private IP.

- If you enable auto-assign public IP, it gets a public IP too.

- IPs don’t conflict because each VPC has its own CIDR range.

</section>

---

<section id="aws_security_group">

## 🔥 What is a Security Group (SG)?
- A Security Group is like a firewall for your EC2 instance.

### 📌 It controls:

- Who can connect to your server

- What type of traffic is allowed (HTTP, SSH, etc.)

> 💡 SG is stateful — if you allow incoming traffic on a port, the response is automatically allowed out.

</section>

---

<section id="aws_sg_example">

## 🔐 Example: Allow Only Your PC to SSH
- Let’s say you want only your personal computer to connect to the EC2 instance via SSH:

- Go to your SG in AWS.

Edit inbound rules:

- Type: SSH

- Port: 22

- Source: Your IP Address/32 (get it from whatismyip.com)

> ✅ Now, only your IP can access the EC2 server via SSH.

</section>

---

<section id="aws_connecting_ec2_public_ip">

## 🖥️ Connecting to EC2 Using Public IP
Once the instance is launched:

- Use AWS EC2 Connect (browser) or

- Use terminal + .pem key and public IP

```bash
ssh -i mykey.pem ubuntu@<public-ip>
```

</section>

<section id="aws_webpage_hosting">

## 🌐 Live Webpage Hosting on EC2 (Ubuntu)
Now let’s make your server public by installing a web server:

```bash
sudo apt update
sudo apt install nginx
cd /var/www/html
sudo vim index.html

# 👉 Add HTML:

<h1>Hello, I am Prashant Gohel</h1>
Then save file (Esc + :wq)

# Check server:

sudo systemctl status nginx
```

</section>

---

<section id="aws_firewall_blocking">

## ❌ Can’t Access Page? Firewall (SG) is Blocking
By default, port 80 is blocked.

> ✅ Fix: Add HTTP rule in Security Group

- Type: HTTP

- Port: 80

- Source: Anywhere (`0.0.0.0/0`)

Now, open:

```bash
http://<your-ec2-public-ip>

# 🎉 Your webpage is live!
```

</section>

----

<section id="aws_nat">

## 🔄 What is NAT?
NAT (Network Address Translation) allows instances in a private subnet to access the internet securely.

### 💡 Use Case:

- You want backend servers to update software (apt, yum, etc.) but not be publicly accessible.

- NAT Gateway allows outbound internet access without exposing them to the public.

</section>

---

<section id="aws_dns">

## 🌐 DNS: Domain Instead of IP
Right now, your site is only accessible via IP — but you want something like:

`www.prashantgohel.in`

### Steps:
- Buy a domain (e.g., from GoDaddy)

- Point the domain to your EC2 public IP via DNS settings

- Go to GoDaddy DNS manager

Add an A record:

```vbnet
Host: @
Type: A
Points to: <your-ec2-public-ip>
TTL: Default
```
> ✅ Now, your website can be accessed using your domain!

</section>

---

<section id="aws_osi_behind_scenes">

## 🧠 OSI Model Behind the Scenes (Quick Review)
| OSI Layer    | Your Activity                                    |
| ------------ | ------------------------------------------------ |
| Application  | Open browser → EC2 Connect or Website            |
| Presentation | AWS encrypts data for security (HTTPS)           |
| Session      | Your browser session to EC2 remains active       |
| Transport    | Data sent via TCP (port 22 for SSH, 80 for HTTP) |
| Network      | IP routing (public/private IP)                   |
| Data Link    | Ethernet/WiFi to router                          |
| Physical     | Fiber cables, routers, network cards             |

</section>

---

<section id="aws_networking_summary">

## ✅ Summary
| Concept        | Real-World Meaning                              |
| -------------- | ----------------------------------------------- |
| VPC            | Your private AWS network                        |
| Subnet         | Small segment of a VPC                          |
| Security Group | Firewall that controls traffic to/from EC2      |
| NAT            | Allows private instances to access the internet |
| DNS            | Maps a domain to your EC2 public IP             |

</section>

---

<section id="aws_vpc_networking">

# ☁️ AWS VPC Networking – Subnets, NAT, Gateways, and Route Tables

<section id="aws_vpc_cli_commands">

## 🔍 First, Some Handy CLI Commands
Before we dive into AWS concepts, here are two network diagnostic tools:

1️⃣ Find IP Address of a Website:
```bash
nslookup google.com

# ✅ This queries DNS and gives you the IP address of the domain.
```

2️⃣ Trace Route to a Website:
```bash
traceroute google.com   # Linux/macOS
tracert google.com      # On Windows

# ✅ Shows the path (hops) your data takes to reach the website — useful to debug latency or blockages.
```

</section>

<section id="aws_vpc_what_is_detailed">

## 🔐 What is a VPC (Virtual Private Cloud)?
> A VPC is your own private, isolated network inside AWS.

- Imagine AWS as a massive city, and your VPC is your private gated colony.

- Inside this colony, you can build homes (EC2), roads (subnets), guards (firewalls), and rules (route tables).

Structure:
```pgsql
AWS Cloud
└── VPC
    ├── Public Subnet (App Server)
    ├── Private Subnet (DB Server)
```

**`Public Subnet`**: Accessible from the internet (e.g., EC2 with web app)

**`Private Subnet`**: Not accessible directly from internet (e.g., RDS DB)

</section>

---

<section id="aws_vpc_db_placement">

## 🛡️ Where to Keep Your Database?
Always place your Database (like Amazon RDS) in the private subnet.

### Why?

- You don't want end users (or hackers) to directly touch your database.

- Only the application (in the public subnet) should access the database internally.

</section>

---

<section id="aws_vpc_app_db_talk">

## 🌐 How App (Public Subnet) Talks to DB (Private Subnet)?
Here’s the challenge:

- Both subnets are isolated from each other.

- IPs in one subnet don’t directly talk to another unless routes exist.

## ✅ Solution: Use NAT Gateway
NAT (Network Address Translation) allows:

- Instances in private subnet to access the internet

- OR talk to resources in public subnet via IP translation.

So:

- App (public) → NAT → DB (private) ✅ Allowed

- User → App works because app is public

- User → DB ❌ Blocked (secure by design)

</section>

---

<section id="aws_vpc_user_access">

## 🌐 But... How Does a User Access My App?

> You said it right — the user is outside AWS, so how can they reach your app which is inside a VPC?

- That's where the Internet Gateway (IGW) comes in.

### 🔌 Internet Gateway (IGW):
- Acts like the main gate to your VPC colony.

- Without IGW, your VPC is cut off from the internet.

✅ Flow:
```scss
User (Browser)
    ↓
Internet Gateway
    ↓
VPC → Public Subnet → EC2 (App)
```

</section>

<section id="aws_vpc_route_table">

## 🧭 What is a Route Table in VPC?
- A Route Table is like a GPS system for AWS networks.

- It tells AWS where to send traffic based on destination IP.

Example:
- In a route table:

- `0.0.0.0/0` → Internet Gateway (for public access)

- `10.0.1.0/24` → Private Subnet (internal routing)

- `0.0.0.0/0` → NAT Gateway (for private instances to access internet)

- Each subnet must be associated with a route table.

</section>

---

<section id="aws_vpc_full_traffic_flow">

## 🔄 Full Traffic Flow: End-to-End Example
Here’s a complete traffic journey from a user to your EC2 app and how your EC2 talks to RDS:

```text
User
    ↓
Internet Gateway (IGW)
    ↓
VPC
    └── Public Subnet
          └── EC2 Instance (Web App)
              └── Talks to RDS (Private Subnet) via NAT Gateway
```

</section>

---

<section id="aws_vpc_peering">

## 📶 Bonus: VPC Peering
> What if you have two separate VPCs (maybe in different regions/accounts) and want them to talk?

- Use VPC Peering — like creating a private tunnel between two VPCs.

💡 You need to:

- Create peering connection

- Accept it

- Update route tables on both sides

- Ensure security groups allow traffic

</section>

---

<section id="aws_vpc_summary_table">

## ✅ Summary Table
| Concept          | Role                                                   |
| ---------------- | ------------------------------------------------------ |
| VPC              | Isolated network in AWS                                |
| Subnet           | Smaller section of a VPC (public/private)              |
| Public Subnet    | Allows internet access                                 |
| Private Subnet   | Internal-only, secure (e.g., DB)                       |
| NAT Gateway      | Allows private subnet to access public subnet/internet |
| Internet Gateway | Lets external users access public subnet               |
| Route Table      | Routes traffic inside/outside the VPC                  |
| VPC Peering      | Connects two VPCs privately                            |

</section>

---

<section id="load_balancer">

# ⚖️ What is a Load Balancer? – With AWS Perspective

<section id="load_balancer_basic_idea">

### 🚦 Basic Idea:
- A Load Balancer acts like a traffic cop that:

- Sits in front of your servers

- Distributes incoming traffic across multiple instances

- Ensures no single instance is overloaded

- Automatically redirects traffic if one server fails

### 🎯 Why is it useful?
- High Availability

- Auto-Scaling support

- Fault Tolerance

- Smooth user experience even during heavy traffic

</section>

---

<section id="load_balancer_types">

## 🏗️ Types of Load Balancers in AWS
You can find these in:

```arduino
AWS Console → EC2 → Load Balancers
```

<section id="load_balancer_alb">

### 1️⃣ Application Load Balancer (ALB)
Works at Layer 7 (Application Layer) of the OSI model

#### ✅ Use when:
- You have web applications (HTTP/HTTPS)

- You need to route based on URL paths (e.g., `/api`, `/login`)

- You want host-based routing (e.g., `admin.example.com`, `user.example.com`)

#### 🧠 Smart features:

- Supports SSL/TLS termination

- Can route based on cookies, user-agent, etc.

#### Example:
- Request → `https://myapp.com/api` → goes to API server

- Request → `https://myapp.com/ui` → goes to Frontend server

</section>

---

<section id="load_balancer_nlb">

### 2️⃣ Network Load Balancer (NLB)
Works at Layer 4 (Transport Layer)

#### ✅ Use when:
- You need ultra-high performance

- You're handling millions of TCP/UDP connections

- For real-time gaming, high-frequency trading, IoT

#### Key Traits:
- Faster, handles low latency

- Routes traffic based on IP and port only

- Supports static IP or Elastic IP

#### Real Example:
- During Flipkart Big Billion Days or Amazon Prime Sale, millions of users connect.
- A Network Load Balancer helps distribute massive TCP/UDP loads across backend servers.

</section>

---

<section id="load_balancer_gwlb">

### 3️⃣ Gateway Load Balancer (GWLB)
Works with third-party virtual appliances (firewalls, monitoring tools)

#### ✅ Use when:
- You want to insert security tools (like Palo Alto, Fortinet) into traffic flow

- For inspection, filtering, or monitoring traffic

</section>
</section>

---

<section id="load_balancer_aws_architecture">

## 🌐 How Load Balancers Fit in AWS Architecture
```text
Internet
    ↓
Application Load Balancer (ALB)
    ↓           ↓
  EC2-1         EC2-2
    ↓           ↓
Private Subnet (RDS)
```
- The ALB handles web traffic

- Distributes to multiple EC2 instances

- These may connect internally to a DB in private subnet

> 💡 You define Target Groups in AWS to decide which EC2s your Load Balancer can send traffic to.

</section>

---

<section id="load_balancer_alb_nlb_comparison">

## 📊 Layer Comparison: ALB vs NLB
| Feature           | ALB (App LB)                | NLB (Network LB)             |
| ----------------- | --------------------------- | ---------------------------- |
| OSI Layer         | Layer 7 (Application)       | Layer 4 (Transport)          |
| Protocols         | HTTP, HTTPS                 | TCP, UDP                     |
| Smart Routing     | Yes (URL, headers, cookies) | No (IP-based only)           |
| Use Case          | Web apps, microservices     | High-speed, high-volume apps |
| Latency           | Slightly higher             | Ultra-low latency            |
| SSL Termination   | Supported                   | Needs extra setup            |
| Static IP support | No                          | Yes                          |

</section>

---

<section id="load_balancer_devops_relevance">

## ✅ Real-World DevOps Relevance
- ALB is common in microservices & containerized apps

- NLB is used in enterprise or real-time data systems

- You’ll use LB with:

    - Auto Scaling Groups

    - ECS / EKS (containers)

    - RDS or backend APIs

</section>

---

<section id="load_balancer_quick_setup">

## 🛠️ Quick Setup Steps (ALB):
1. Go to EC2 → Load Balancers → Create ALB

2. Select internet-facing

3. Choose HTTP / HTTPS

4. Create Target Group (EC2 or IP based)

5. Register your EC2 instances

6. Add Listeners & Rules (e.g., route `/api` to `backend1`)

7. Launch and test via ALB DNS name

</section>
