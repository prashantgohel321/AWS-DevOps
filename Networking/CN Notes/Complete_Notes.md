# 🌐 Introduction to Computer Networking (CN)

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

---

## 🤔 Why Networking Matters in DevOps?

As a DevOps Engineer, your job involves working with servers, cloud systems, and automations.

### 🧰 So why is networking important?

- You often transfer files between servers.

- You need to configure firewalls, load balancers, DNS records, and monitor traffic.

- You might have to SSH into a remote machine, which is part of a network.

In short, you can’t do DevOps without a good grip on networking.

---

## 🌍 How Does the Internet Work?

Let’s make this super simple:

🎬 **Example**: You’re watching Netflix in India
But Netflix's main servers are in the USA.
So how does your request reach them?

You might imagine that data travels through satellites. Yes, that’s possible, but it’s slow due to the distance.

✅ Real Answer: Undersea Optical Fiber Cables
Oceans are filled with underwater fiber cables — these cables carry data at high speed and low latency.

So when you visit www.netflix.com, here’s what happens:

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

---

## 🔧 Try It Yourself (Practical Commands)

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

### 📶 Check Connection
Use ping to see if you can reach a server:
```bash
ping google.com
```
It sends small packets to Google and shows if it’s reachable and how long it takes (latency).

---

<br>
<br>
<br>
<br>

## 🧠 The OSI Model

OSI (Open Systems Interconnection) Model is a framework that standardizes how data is transferred between two systems over a network.

It has 7 layers, each with a specific role in ensuring smooth, secure, and reliable communication.

### 🎮 Imagine This:
Two friends, A and B, are playing a multiplayer online game from different countries.

Let’s use this scenario to understand how the OSI Model works.

### 📚 OSI Layers Mnemonic:

**A**ll **P**eople **S**eem **T**o **N**eed **D**ata **P**rocessing

(Application → Physical)

---

<br>
<br>

### 🔼 Layer 7: Application Layer – “Let’s Play!”
This is where A and B run the actual game app (e.g., PUBG, Fortnite).

- This is the **interface** between the user and the network.

- They use a browser or mobile app.

- Protocols: HTTP, HTTPS, FTP, SMTP

> 💡 In DevOps, you work with these protocols while managing servers and web apps.

---

<br>
<br>

### 🎨 Layer 6: Presentation Layer – “Graphics, Sounds, and Security”
A and B are seeing graphics, using keyboard, listening to game sounds, and the data is encrypted.

- It manages how the data is presented: format, encoding, encryption.

- It converts data to be readable by the receiver.

- Also responsible for SSL/TLS encryption (important in HTTPS).

> 🛡️ Think of this as the syntax and security formatting of the data.

---

<br>
<br>

### 🔌 Layer 5: Session Layer – “Let’s Connect”
Before playing, a connection is established between A and B (like a game lobby).

- This layer establishes, maintains, and ends communication sessions.

- Responsible for authentication and session management.

#### 🔧 Examples:

**API sessions**: when apps talk to each other (e.g., payment gateways).

**Sockets**: used for real-time communication like chat, games, etc.

> 👉 API: Bridge between two apps (e.g., Google Maps inside Zomato app)

> 👉 Socket: Real-time data channel (e.g., online multiplayer game, live chat)

---

<br>
<br>

### 📦 Layer 4: Transport Layer – “Send It Reliably”
The game data like movements, actions, chat is now broken into packets and sent between A and B.

- Responsible for reliable delivery, error checking, and flow control.

#### Protocols:

**TCP (Transmission Control Protocol)** – Reliable, connection-based

**UDP (User Datagram Protocol)** – Faster but no guarantee (used in live games, video calls)

> 🧪 You’ll hear this in DevOps when setting up ports, firewalls, or troubleshooting connection issues.

---

<br>
<br>

### 🛰️ Layer 3: Network Layer – “Find the Way”
A and B’s data has to travel across the globe. So it needs routing.

- Responsible for IP addressing and routing.

- It finds the best path for data.

#### Protocol: IP (Internet Protocol)

> 📍 Example: Your request goes from India to the US via routers using IPs.

You can trace this using:

```bash
traceroute google.com  # Linux/macOS
tracert google.com     # Windows
```

---

<br>
<br>

### 🔗 Layer 2: Data Link Layer – “Local Delivery”
Now the data is being transferred within the same local network (e.g., from your laptop to your WiFi router).

- Deals with MAC addresses, frames, and error detection.

- Ensures data is sent to the right device on a local network.

👀 You can check your MAC address using:

```bash
ip link show
```

---

<br>
<br>

### 🧱 Layer 1: Physical Layer – “The Real Wires”
Finally, all of this data flows through real hardware – like fiber optic cables, network cards, or WiFi signals.

- Transmits 0s and 1s (binary data) over physical medium (cables, radio waves).

#### Includes: Cables, Switches, Hubs, Connectors, NICs.

> 💡 Without this, the internet wouldn’t exist physically.

---

<br>
<br>

### 🔄 Software vs Hardware in OSI Model
| Layer                        | Handled By                             |
| ---------------------------- | -------------------------------------- |
| Application to Session (7–5) | **Software** (Apps, APIs, OS services) |
| Transport to Physical (4–1)  | **Hardware + OS + Network tools**      |

---

<br>
<br>

## 🧵 Final Summary: Gaming the OSI Model

| Layer           | Game Analogy          | Real Function                    |
| --------------- | --------------------- | -------------------------------- |
| 7. Application  | Running the Game      | Interface for user apps          |
| 6. Presentation | Graphics & Encryption | Data formatting, encryption      |
| 5. Session      | Connection Setup      | Session control (API/Sockets)    |
| 4. Transport    | Sending Actions       | Reliable data delivery (TCP/UDP) |
| 3. Network      | Global Routing        | IP addressing and routing        |
| 2. Data Link    | Local Network         | MAC address & local delivery     |
| 1. Physical     | Hardware/Signals      | Cables, NICs, electrical signals |

---

<br>
<br>

### ✅ Ready for DevOps?
OSI is more than theory. You’ll use it when:

- Configuring ports (Layer 4)

- Understanding IP routing and DNS (Layer 3)

- Managing VPNs and proxies

- Debugging with ping, traceroute, netstat, tcpdump, etc.

---


<br>
<br>

# 🌐 TCP/IP Reference Model

## ✅ What is the TCP/IP Model?
The TCP/IP Model **(Transmission Control Protocol / Internet Protocol)** is the framework used in real-world networks, including the internet.

🧠 Fun Fact:

- It was developed by the U.S. Department of Defense.

- It’s more practical than OSI.

- The entire internet works using this model!

---

<br>
<br>

### 🔢 TCP/IP vs OSI – Layer Comparison Table

| TCP/IP Model          | OSI Model                              | Description                                      |
| --------------------- | -------------------------------------- | ------------------------------------------------ |
| 4️⃣ Application Layer | OSI Layers 7, 6, 5 (App, Pres, Sess)   | User-facing services like HTTP, FTP, DNS         |
| 3️⃣ Transport Layer   | OSI Layer 4 (Transport)                | Ensures data delivery (TCP/UDP)                  |
| 2️⃣ Internet Layer    | OSI Layer 3 (Network)                  | IP addressing and routing                        |
| 1️⃣ Network Access    | OSI Layers 2 & 1 (Data Link, Physical) | Deals with MAC, switches, physical data transfer |

---

<br>
<br>

## 🔍 Layer-by-Layer Explanation

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

---
<br>
<br>

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

---

<br>
<br>

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

---

<br>
<br>

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

---

<br>
<br>

## 🔁 End-to-End Flow Example
🧑‍💻 User A wants to open www.example.com
- Application Layer: Browser sends HTTP request

- Transport Layer: Data broken into TCP segments

- Internet Layer: Adds IP header to route packets

- Network Access Layer: Frames sent via Ethernet/Wi-Fi to local router

---

<br>
<br>

## 🚀 Final Tip for DevOps Learners
Think of the TCP/IP model not just as theory, but as a troubleshooting tool.

If something goes wrong:

- Is the domain not resolving? → DNS issue (Application layer)

- Can’t connect to server? → Port or firewall (Transport layer)

- Packet not reaching? → Routing (Internet layer)

- No connection at all? → Cable/Wi-Fi issue (Network Access layer)

---

