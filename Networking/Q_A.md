# DevOps Networking Interview/Viva Questions with Answers

<details>
<summary>1. What is the OSI model and how is it practically relevant to DevOps?</summary>
The OSI model is a 7-layer framework describing how data moves through a network: Application, Presentation, Session, Transport, Network, Data Link, and Physical. 

In DevOps, understanding OSI helps troubleshoot where things break — e.g., SSH failures (Session), broken connectivity (Network), or port blocks (Transport). Most DevOps tasks relate to the top 4 layers.
</details>

<br>

<details>
<summary>2. How does the TCP/IP model differ from the OSI model in real-world usage?</summary>

The TCP/IP model is a simplified 4-layer version: Application, Transport, Internet, and Network Access. 

In practice, it’s more used than OSI. For example, HTTP operates at the Application layer, TCP at Transport, IP at Internet, and Ethernet at Network Access. 

It maps directly to what DevOps deals with in real networking tasks.
</details>

<br>

<details>
<summary>3. What’s the difference between public IP, private IP, and Elastic IP in AWS?</summary>

- **Public IP**: Auto-assigned; released on stop/terminate.

- **Elastic IP**: Static public IP you reserve; remains even after instance stops.

- **Private IP**: Used for internal VPC communication.

For DevOps, using Elastic IP ensures reliable DNS mapping for external services.
</details>

<br>

<details>
<summary>4. Why do we need DNS when every device already has an IP address?</summary>

- Because IPs are hard to remember and may change. 

- DNS maps human-readable names (e.g., google.com) to IPs. 

- DevOps often configures Route53 or external DNS to route traffic to services, and debugging DNS failures is a key skill.
</details>

<br>

<details>
<summary>5. Explain how a basic HTTP request travels from a browser to a web server.</summary>

- Browser initiates request → DNS resolves IP → TCP 3-way handshake → HTTP request sent over TCP → server responds → browser renders content. 

- If HTTPS, TLS handshake happens before data exchange. 

- DevOps engineers monitor or troubleshoot this flow using tools like tcpdump, netstat, or curl -v.
</details>

<br>

<details>
<summary>6. What are ports? Why does your system use dynamic ports in a TCP connection?</summary>

- **Ports** identify services on a device. Well-known ports like 80 (HTTP) and 22 (SSH) are server-side. 

- Clients use dynamic/private ports (49152–65535) so multiple outbound connections can coexist. 

- It ensures proper response routing on multi-tab browsing or API calls.
</details>

<br>

<details>
<summary>7. Difference between TCP and UDP — when would you use each in DevOps?</summary>

**TCP**: Reliable, ordered, slow — used for web, SSH, DBs.

**UDP**: Fast, no guarantee — used for DNS, monitoring, video.

- DevOps tools like Prometheus may use UDP to push metrics; SSH/HTTPS-based tools use TCP.
</details>

<br>

<details>
<summary>8. What is a VPC and why is it needed in cloud environments like AWS?</summary>

- A VPC is an isolated virtual network within AWS. It gives full control over IP ranges, routing, and access control. 

- DevOps uses it to separate public-facing apps from private services like databases, following best practices for security and scalability.
</details>

<br>

<details>
<summary>9. How do NAT and Internet Gateways work in AWS VPC?</summary>

**Internet Gateway (IGW)** lets public subnets access the internet.

**NAT Gateway** allows private subnets to initiate outbound traffic (e.g., install packages), while blocking inbound internet traffic.

Essential for secure architecture in production deployments.
</details>

<br>

<details>
<summary>10. What is a Security Group (SG) and how is it different from a Network ACL?</summary>

**SG**: Virtual firewall at instance level; stateful; applies to inbound & outbound.

**NACL**: Subnet-level; stateless; must allow return traffic separately.

In DevOps, SGs are more common for securing EC2, RDS, or ALBs.
</details>

<br>

<details>
<summary>11. How does Load Balancer (ALB vs NLB) differ in AWS?</summary>

**ALB**: Works at Layer 7; routes based on content (URL, host). Ideal for web apps.

**NLB**: Works at Layer 4; routes based on IP/TCP; high-performance needs.

Use ALB for microservices, NLB for large-scale, low-latency apps.
</details>

<br>

<details>
<summary>12. Explain what happens when you ssh into an EC2 instance.</summary>

Browser or terminal resolves hostname → connects to public IP → SSH handshake using key-based authentication → session established over TCP port 22. SG must allow port 22. 

DevOps engineers must know this to automate deployments and troubleshooting.
</details>

<br>

<details>
<summary>13. How do protocols like ICMP, SNMP, and ARP help in networking?</summary>

**ICMP**: Sends error/status messages (`ping`, `traceroute`)

**SNMP**: Monitors network hardware (e.g., CPU, memory of routers)

**ARP**: Maps IP to MAC in LAN

DevOps may use ICMP for health checks, SNMP in monitoring tools.
</details>

<br>

<details>
<summary>14. What tools help you troubleshoot network issues in Linux?</summary>

**`ping`**: Check if host is reachable

**`traceroute`**: Trace route packets take

**`netstat`**: Show active connections & ports

**`dig`** or **`nslookup`**: DNS troubleshooting

**`tcpdump`**: Capture packets for inspection

These tools are essential in DevOps for resolving network latency, DNS failures, and firewall blocks.
</details>

<br>

<details>
<summary>15. Why is understanding CIDR/subnets crucial in DevOps cloud deployments?</summary>

CIDR defines IP ranges. Subnetting helps isolate components — app vs DB — and controls traffic via route tables and SGs. Misconfigured CIDR blocks can prevent communication or lead to IP conflicts.
</details>

<br>

<details>
<summary>16. Explain POP3 vs IMAP in terms of email retrieval.</summary>

**POP3**: Downloads & deletes from server — limited to one device

**IMAP**: Syncs with server — usable on multiple devices

Used in CI tools or alerting systems where DevOps needs mail server access.
</details>

<br>

<details>
<summary>17. What is the role of DNS in custom domain mapping to an EC2 instance?</summary>

DNS (e.g., Route53 or GoDaddy) maps domain to public IP (A record). 

If IP changes, update DNS or use Elastic IP. This is crucial when hosting websites or APIs from EC2 for clients/users.
</details>

<br>

<details>
<summary>18. Why is SFTP/FTPS preferred over FTP in production?</summary>

FTP is plaintext; SFTP (via SSH) and FTPS (via TLS) encrypt data. 

DevOps must use secure protocols for handling credentials, deployment artifacts, or logs during file transfers.
</details>

<br>

<details>
<summary>19. What is a Route Table and why is it important in AWS?</summary>

Route Tables define where traffic from a subnet goes — IGW, NAT, or other subnets. Without correct routing, even SGs won’t fix connectivity issues. 

Critical when setting up multi-tier apps or VPC peering.
</details>

<br>

<details>
<summary>20. How does DHCP help automate cloud and on-prem networking?</summary>

DHCP assigns IPs dynamically. Without it, IPs must be manually set — error-prone and inefficient. Most cloud VMs or Docker containers rely on DHCP during boot.
</details>

<br>

<details>
<summary>21. How do you generate and associate an Elastic IP in AWS, and when should you use it?</summary>

In AWS, an Elastic IP (EIP) is a static, public IPv4 address designed for dynamic cloud computing. Unlike a regular public IP (which changes when the instance is stopped), an EIP persists until you release it.

To generate and associate one:

1. Go to the EC2 Dashboard.

2. Under "Network & Security", click on "Elastic IPs".

3. Click “Allocate Elastic IP address”.

4. Choose Amazon’s pool of IPv4 addresses and allocate it.

5. After it's created, click “Actions > Associate Elastic IP address”.

6. Select the target EC2 instance or its network interface, and associate.

You should use an Elastic IP when:

- You want your instance to have a permanent public IP (e.g., for DNS or external services).

- You're hosting a public web service or app that must retain its IP even across instance restarts.

Note: AWS charges you for unused EIPs — so only allocate when necessary.
</details>

<br>

<details>
<summary>22. What is the purpose of a Security Group in AWS, and how does it differ from a Network ACL?</summary>

A **Security Group (SG)** in AWS acts as a virtual firewall at the instance level, controlling inbound and outbound traffic. It is stateful, meaning if you allow inbound traffic, the response is automatically allowed outbound.

A **Network ACL (NACL)** works at the subnet level and is stateless—you must define both inbound and outbound rules explicitly.

Use **Security Groups** for application-specific access (like port 22 for SSH), and **NACLs** for broad subnet protections.
</details>

<br>

<details>
<summary>23. What is a NAT Gateway and when do you use it in a VPC?</summary>

A NAT Gateway enables private subnet instances in a VPC to initiate outbound traffic (like software updates or accessing APIs) to the internet without allowing inbound traffic from the internet.

Use Case:

- EC2 in private subnet needs to download updates from the internet.

- You want to protect the private instance from direct internet access.

Steps:

- Place NAT Gateway in a public subnet.

- Update the route table of private subnet to forward internet-bound traffic (0.0.0.0/0) to the NAT Gateway.

NAT Gateway is managed, scalable, and preferred over legacy NAT instances.
</details>

<br>

<details>
<summary>24. What is a Route Table in AWS and how does it control traffic?</summary>

A Route Table is used to determine where network traffic is directed within a VPC.

Every subnet must be associated with a route table, and it contains rules (routes) for directing traffic to:

- Local subnet

- Internet Gateway

- NAT Gateway

- VPC Peering Connections

- VPN or Direct Connect

Example:

- 0.0.0.0/0 -> IGW (for public subnets)

- 10.0.1.0/24 -> peering-connection-id (for VPC Peering)

**Trick**: If your instance is not accessible, always check route tables, IGW, and SGs—missing route entry is a common cause!
</details>

<br>

<details>
<summary>25. What is VPC Peering and what are its limitations?</summary>

VPC Peering connects two VPCs privately using AWS’s backbone without exposing traffic to the internet. It allows you to route traffic between them using private IPs.

Limitations:

- Transitive peering is not allowed: VPC A cannot talk to VPC C via VPC B.

- No overlapping CIDR blocks are allowed.

- Needs manual route table updates on both sides.

- Doesn’t support DNS resolution across VPCs by default (need to enable).

- Use Case: Connect app servers in one VPC to a database in another securely.
</details>

<br>

<details>
<summary>26. What is an Internet Gateway (IGW) and when is it required?</summary>

An **Internet Gateway** is a horizontally scaled, redundant AWS component that connects your VPC to the internet.

Required when:

- You want instances in a public subnet to access or be accessed from the internet.

- You’ve assigned a public IP or Elastic IP to your instance.

- You have a route 0.0.0.0/0 -> IGW in your subnet’s route table.

Tip: Having a public IP without IGW or route table entry means your instance is unreachable from outside.
</details>

<br>

<details>
<summary>27. How do you create and use an Elastic IP in AWS?</summary>

An **Elastic IP (EIP)** is a static public IPv4 address. It stays with your account until released and can be remapped between instances.

Steps to create and use:

1. Go to EC2 > Elastic IPs > Allocate Elastic IP.

2. After allocation, click Actions > Associate to bind it with an EC2 instance or a Network Interface.

3. Update your Security Group to allow necessary ports (e.g., 22 for SSH, 80 for HTTP).

Use Case: Ideal when your server needs a fixed IP for DNS or external API whitelisting.
</details>

<br>

<details>
<summary>What does 0.0.0.0/0 mean?</summary>

0.0.0.0/0 is a CIDR (Classless Inter-Domain Routing) notation.

It means "any IPv4 address", i.e., ALL possible IPs.

This is not a broadcast; it's a wildcard or default route.

/0 means 0 bits are fixed, so everything is allowed, from 0.0.0.0 to 255.255.255.255.
</details>
