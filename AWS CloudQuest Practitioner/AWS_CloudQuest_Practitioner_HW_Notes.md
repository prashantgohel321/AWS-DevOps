AWS CloudQuest Practitioner Notes
=================================

Virtual Private Cloud (VPC)
---------------------------

A VPC is simply a virtual network dedicated to your AWS account. It allows you to launch and manage your AWS resources like EC2 instances and databases within an isolated environment.

### Accessing EC2 Instances from Subnets

EC2 instances can be accessed from different types of subnets:

1.  **Public Subnet:** Instances can be accessed from the internet via an Internet Gateway (IG).
    
2.  **Private Subnet:** Instances cannot be directly accessed from the internet.
    
3.  **VPN Only Subnet:** Traffic is routed through a Virtual Private Gateway (VPG) for VPN connections.
    

### Why is there a need for VPC?

VPC is needed to ensure:

*   **Security:** You can control who accesses what using subnets, firewalls (Security Groups), and route tables.
    
*   **Isolation:** Your resources are separated from others, like your own private space in AWS.
    
*   **Custom Networking:** You can define your own IP ranges, subnets, and gateways.
    
*   **Internet Control:** You decide which resources are public or private.
    

### Subnets

A subnet represents a range of IP addresses within a Virtual Private Cloud. Each subnet must be contained within a single Availability Zone (AZ) and cannot span across multiple AZs.

Internet Gateway (IG)
---------------------

An Internet Gateway is used to connect your VPC to the internet. It allows resources in a public subnet (like web servers) to send and receive data over the internet. Without an IG, your VPC is completely private.

Virtual Private Gateway (VPG)
-----------------------------

A VPG is used to connect your VPC to your on-premise network (like your office or data center) using a VPN connection. It enables secure communication between AWS and your physical network and is commonly used in hybrid cloud setups.

VPN (Virtual Private Network)
-----------------------------

A VPN is a secure, encrypted connection between networks over the internet. In AWS, it's used to connect your on-premise network to your AWS VPC securely, working through the VPG. It ensures safe data transfer between your AWS cloud and physical network, providing privacy and protection even when using a public subnet.

Route Table
-----------

A route table is a set of rules in your VPC that tells AWS where to send network traffic. Each route specifies:

*   **Destination CIDR:** (e.g., 0.0.0.0/0 for all traffic).
    
*   **Target:** (e.g., IG, NAT Gateway, VPG).
    

Every subnet uses one route table. Traffic from instances in that subnet follows its table's rules. By editing these rules, you control whether traffic goes to the internet, to a VPN, or stays within your VPC. In short, route tables direct your packets along the right path, both inside and outside your VPC.

CIDR (Classless Inter-Domain Routing)
-------------------------------------

CIDR is a way to represent IP address ranges more efficiently.

*   **Format:** IP address / Prefix-length
    
*   **Example:** 192.168.0.0/24 means the first 24 bits are fixed for the network, and the rest can vary for hosts.
    

VPCs in a peering connection cannot have overlapping CIDR blocks.

IP Address (Internet Protocol)
------------------------------

An IP address is a unique number given to each device on a network so they can communicate with each other. It's like a phone number or a home address for devices.

### Why is IP needed?

Without IP addresses, devices would not know where to send or receive data. When a computer sends data (like opening a website), it needs:

*   Your IP address (so the server knows where to send data back).
    
*   Server IP address (so your request knows where to go).
    

### Two versions of IP: IPv4 and IPv6

#### IPv4

*   Most commonly used.
    
*   Format: 4 numbers separated by dots (e.g., 192.168.1.1).
    
*   Each number ranges from 0-255.
    
*   Each number is called an octet (8 bits).
    
*   IPv4 addresses are 32 bits long (4 octets x 8 bits/octet).
    
*   **Usable range (for 192.168.1.0/24):** 192.168.1.1 to 192.168.1.254.
    
    *   192.168.1.0: Network Address (represents the entire network, not assigned to any device, used by routers and systems to identify subnets).
        
    *   192.168.1.255: Broadcast Address (used to send a message to all devices in a subnet, not assigned to any single device).
        
    *   Total IPs: 256 (0 to 255). Usable IPs for devices: 254 (excluding network and broadcast addresses).
        

#### Public vs. Private IPv4 Addresses

*   **Public IPv4 addresses:** Enable instances to communicate with internet services and allow inbound traffic from the public internet.
    
*   **Private IPv4 addresses:** Enable instances to communicate securely within your network, but cannot directly access or be accessed from the public internet without a NAT (Network Address Translation) or other gateway.
    

#### IPv6

*   Newer version to fix IPv4 shortage.
    
*   Format: 8 groups of hexadecimal numbers (e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334).
    

Security Groups (SGs)
---------------------

Security Groups are virtual firewalls in AWS that control inbound and outbound traffic for your resources, like EC2 instances.

*   **Inbound Rules:** Define what traffic is allowed to come in (e.g., allow HTTP on port 80).
    
*   **Outbound Rules:** Define what traffic is allowed to go out (e.g., allow internet access).
    

By default:

*   All inbound traffic is blocked.
    
*   All outbound traffic is allowed.
    

In short, SGs protect your resources by controlling who can connect and how. They are **stateful**: if your instance sends a request somewhere, the reply is allowed to come back in, even if there is no rule allowing that in the inbound rules. Also, if something comes in because of an allowed inbound rule, the response can go back out, even if the outbound rules don't allow it.

SGs only allow traffic – they don't block it. You can't create rules that deny access. Instead, you use rules to allow specific traffic based on things like protocol (e.g., TCP, UDP) and port number (e.g., 22 for SSH, 80 for HTTP, 443 for HTTPS, 3306 for MySQL).

SGs are linked to a single VPC. You can assign an SG to one or more EC2 instances, but that SG must be in the same VPC as the SG.

Gateway
-------

A gateway is a network component that acts as a bridge between different networks, such as connecting your VPC to the IG, or to on-premises networks (VPG).

VPC Peering Connection
----------------------

A VPC peering connection is a networking connection between two VPCs that allows them to communicate with each other privately, as if they are in the same network. By default, VPCs are isolated.

### Why use VPC Peering?

It's used, for example, if you have one VPC for web servers and another VPC for your databases. You peer them so they can talk to each other securely without going over the internet.

*   It is a **one-to-one** connection.
    
*   Route tables must be configured for peering to work effectively.
    
*   Communication is **not transitive**: If VPC A is peered with VPC B, and VPC B is peered with VPC C, VPC A and VPC C cannot communicate directly unless A is also peered with C. Each VPC must be directly peered to talk.
    
*   Only private IP communication.
    
*   After the peering connection has been established and route tables configured, resources in each VPC can communicate.
    

### Example Route Tables for Peering

*   **Marketing VPC** (CIDR: 10.0.0.0/16)
    
    *   Destination: 172.31.0.0/16 (Finance VPC) -> Target: pcx-finance-marketing (VPC Peering Connection)
        
    *   This allows Marketing to talk to Finance only.
        
*   **Finance VPC** (CIDR: 172.31.0.0/16)
    
    *   Destination: 10.0.0.0/16 (Marketing VPC) -> Target: pcx-finance-marketing
        
    *   Destination: 192.168.0.0/20 (Developer VPC) -> Target: pcx-finance-dev
        
*   **Developer VPC** (CIDR: 192.168.0.0/20)
    
    *   Destination: 172.31.0.0/16 (Finance VPC) -> Target: pcx-finance-dev
        

Note: You must update Security Groups (SGs) to allow traffic from peered VPCs as an incoming source. SGs do not automatically accept data from peered VPCs.

NAT (Network Address Translation) Gateway
-----------------------------------------

A NAT Gateway allows instances with private IP addresses to access the internet while still preventing inbound traffic from the internet from reaching those instances directly.

Connecting to an Amazon EC2 Instance in AWS
-------------------------------------------

You can connect to an EC2 instance via:

*   **Session Manager:** Accessible from the AWS console, it provides an interactive one-click browser-based shell or AWS CLI access. You can manage your Amazon EC2 instances, edge devices, and on-premises servers/VMs without opening inbound ports or managing SSH keys.
    
*   **SSH Client:** (e.g., PuTTY for Windows, terminal for Linux/Mac).
    

DynamoDB (NoSQL Database)
-------------------------

DynamoDB is a Key-Value (stores data as key-value pairs) and Document database (stores data in JSON-like documents) that delivers single-digit millisecond performance at any scale.

### Characteristics of a DynamoDB Table

A DynamoDB table is a collection of data (items). Each item has a unique identifier called a primary key.

### Primary Keys

DynamoDB supports two kinds of primary keys:

1.  **Partition Key:**
    
    *   Mandatory.
        
    *   DynamoDB uses the Partition Key's value to an internal hash function. The output determines the partition, which is a physical storage internal to DynamoDB where the item will be stored.
        
    *   The Partition Key creates partitions for scalability purposes.
        
2.  **Sort Key:**
    
    *   Optional.
        
    *   Provides additional flexibility for querying data.
        

DynamoDB supports two primary key types:

*   A **simple primary key** that only uses a Partition Key.
    
*   A **composite primary key** that combines a Partition Key with a Sort Key.
    

### Benefits of DynamoDB

*   It is a type of NoSQL DB that doesn't need a server. This means you don't have to manage any hardware or setup. You only pay for what you use.
    
*   Auto-scales up or down.
    
*   Amazon manages updates, patches, and maintenance.
    

DynamoDB saves data in partitions, which are like storage blocks. These are stored on fast SSDs and are automatically copied across different Availability Zones (AZs) in the same AWS region to keep data safe & always available.

When you add an item to a DynamoDB table, it uses the partition key value and runs it through a hash function. The hash result decides which partition the item will be stored in.

### Query vs. Scan Operation

*   **Query operation:** In DynamoDB, lets you find items using the Primary Key. You must give the partition key name and its value. It will then return all items with that key. If the table also has a sort key, you can use it with filters (like greater than, equals) to narrow down the results. When you run a Query, it looks for an exact match of the partition key. If you also give a sort key, it helps to filter the results even more.
    
*   **Scan operation:** Checks every item in a table or index and returns matching items. If a scan goes over 1MB of data, it stops and gives a Last Evaluated Key, which you can use to continue scanning later.
    

Amazon EFS (Elastic File System)
--------------------------------

Amazon EFS is a shared cloud storage service that lets multiple EC2 instances access the same files at the same time. It works like a regular folder on each server, but the data is stored in the cloud. EFS automatically grows or shrinks as you add or remove files, and it is easy to set up and use across different AZs.

To make web management easier, Amazon EFS is used so that all servers can share the same files instead of storing them separately.

Once EFS is set up, EC2 instances in the same VPC can access it at the same time. Each AZ gets a mount target (endpoint), which servers in that AZ use to connect EFS as a local folder. You can also add more EC2 instances anytime by connecting them to the internal mount target in their AZ.

*   **Protocol:** Network File System (NFS).
    
*   Amazon EFS requires an inbound NFS rule. By selecting an SG as the incoming source, any EC2 instances linked to the SG you select will have NFS client access to the file system.
    
*   Amazon EFS is a fully managed service that lets you use popular third-party file systems in the AWS cloud. It removes the need to manage or set up your own file servers and storage.
    
*   After creating EFS, you create mount targets on each subnet. The mount target enables communication from EC2 instances on the subnet.
    
*   The Amazon EFS client software (amazon-efs-utils) is a free, open-source tool used to connect and access EFS from Linux systems.
    

EC2 Auto Scaling Groups
-----------------------

An EC2 Auto Scaling group is configured to automatically add or remove EC2 instances based on the workload of an application.

1.  First, an **AMI (Amazon Machine Image)**, which is a template of the app server, is created.
    
2.  Then, a **Launch Template** is made to define how new instances should be started (like type, AMI, Key Pair).
    
3.  The Auto Scaling group uses this template to scale EC2 instances up or down. For example, if CPU usage goes up, a CloudWatch alarm adds a new instance. If usage drops, it removes extra servers.You can also set scheduled actions to start or stop instances at specific times, like during peak hours or after the work is done.
    

AMI (Amazon Machine Image)
--------------------------

An AMI is a template that contains the software configuration (like OS, app servers, & apps) required to launch a new EC2 instance in AWS.

*   You can capture the contents of an instance and its volume into an AMI.
    
    *   **Steps:** Select instance -> Actions -> Image and Templates -> Create Image.
        
*   By default, when you create an AMI, EC2 shuts down the instance, takes snapshots, creates and registers the AMI, and then reboots the instance (you can use "No reboot" option if you don't want to reboot).
    
*   AMIs are region-specific. To use an AMI in another region, you need to copy it to that region.
    

Launch Template
---------------

A Launch Template in EC2 is a feature that lets you save instance settings (like AMI ID, instance type, and network settings) so you don't have to enter them every time you launch an instance.

*   You can have up to 5,000 templates per Region and 10,000 versions per template.
    
    *   **Steps:** EC2 -> Launch Templates -> Create Launch Template.
        
*   A **Key Pair** is a security credential to log in to EC2 instances – SSH for Linux, RDP for Windows. It includes a public key (stored by AWS) and a private key (downloaded and kept securely by the user). The private key must be kept safe and should not be uploaded to cloud storage.
    
*   Use of Launch Template: Helps to set up Auto Scaling and self-healing. If a server fails, the template provides the details needed to automatically launch a new one with the same configuration.
    

AWS Auto-Scaling Overview
-------------------------

AWS Auto-Scaling helps you automatically add or remove resources (like EC2 instances) based on demand. It balances performance and cost.

*   You can set desired instance limits (min, max, and target count).
    
*   It uses EC2 and Load Balancer health checks to decide if an instance is unhealthy.
    
*   With target tracking policies, you set a goal (e.g., 70% CPU usage), and Auto-Scaling adjusts the instance count to meet that target.
    
*   CloudWatch alarms are automatically set up to trigger scaling actions.
    
*   You can get notifications through Amazon SNS when instances are launched or removed.
    
*   You can also track the scaling history and see which condition triggered the scale.
    
*   **Steps:** EC2 -> Auto Scaling -> Auto Scaling Groups -> Create Auto Scaling group.
    
    1.  Choose launch template or configuration.
        
    2.  Choose instance launch options.
        
    3.  Configure group size & scaling.
        
    4.  Integrate with other services.
        
    5.  Add notifications.
        
    6.  Add tags.
        
    7.  Review.
        

Scheduled Scaling & Target Tracking
-----------------------------------

*   **Scheduled Scaling:** Lets you plan when to scale your EC2 instances based on expected traffic patterns. For example, if your app gets more traffic every evening or Monday morning, you can schedule scaling in advance to handle it.
    
*   **Target Tracking Policies:** Use CloudWatch metrics to monitor a metric (like CPU usage). Two alarms are created:
    
    1.  One to scale out (add instances) when usage is high.
        
    2.  One to scale in (remove instances) when usage drops.CloudWatch monitors each instance's CPU usage, and when a set threshold is hit, it notifies the Auto Scaling group to take action. This ensures your app has enough power when needed and saves cost when demand is low.
        

Highly Available Web Applications with AWS
------------------------------------------

Making an application highly available with AWS involves several services:

1.  **Domain Management with Route 53:** When a user types your website name, Amazon Route 53 translates that name into an IP address – basically telling the browser where to go. This is like using someone's name to find their house address.
    
2.  **Faster content with CloudFront:** Once the IP is found, the user connects to a CloudFront application distribution, which is a global CDN. It stores (caches) copies of your site's static content like images and videos closer to the users, so the site loads much faster. This static content is originally stored in Amazon S3.
    
3.  **Load Balancing with ELB (Elastic Load Balancing):** To make sure no single server is overloaded, ELB spreads incoming traffic across multiple EC2 instances. These instances are set up in different AZs, so even if one AZ fails, your app still runs.
    
4.  **Scaling Automatically with EC2 Auto Scaling:** As the number of users grows or drops, Amazon EC2 Auto Scaling adds or removes servers automatically. For example, if CPU usage crosses 80% for some time, a new EC2 instance is launched to handle the load. This keeps your app responsive without wasting money on unused resources. These scaling decisions are based on metrics watched by Amazon CloudWatch.
    
5.  **Database with Amazon RDS (Relational Database Service):** Your app often needs a database to store user data or content. That's where Amazon RDS comes in. It provides a managed, reliable database service. If the main database crashes, it auto-switches to backup instances, and your app keeps working.
    

### How Load Balancers work with Auto Scaling in AWS

Think of a Load Balancer as the reception desk for your web application. Every user (guest) comes to this desk. The Load Balancer then decides which web server (EC2 instance) will handle the request.

When using it with Auto Scaling, it keeps track of which servers are active. New EC2 instances are auto-registered. When instances shut down, they are de-registered.

### What is an ALB?

*   **ALB (Application Load Balancer):** A type of Load Balancer that operates at Layer 7 (Application layer). This means it understands things like HTTP requests, URLs, and cookies.
    
*   It distributes traffic across multiple EC2 instances. So, instead of overloading one server, it spreads the work evenly across many.
    
*   **Target Groups:** ALBs send traffic to a group of EC2 instances called target groups.
    
*   **To improve availability:** ALB lets you enable multiple AZs. ALB routes traffic only to instances in healthy AZs.
    

### Security Groups for Load Balancers

SGs are firewall rules that control traffic in and out.

*   To allow public traffic (e.g., from the internet): Use 0.0.0.0/0.
    
*   To increase security: Instead of allowing all traffic, use a restricted SG. Only allow traffic to ELB from a specific security group (like for web traffic) or source IP. This avoids exposing EC2 instances directly to the internet.
    
*   The SG can only be assigned to resources within the same VPC.
    
*   You can assign multiple SGs to an instance.
    

Subnets & Auto Scaling Groups
-----------------------------

Your Auto Scaling Groups live in specific subnets. You can add or remove subnets to control where EC2 instances are launched. For security, put your app in a private subnet and let the ALB (which is public) handle traffic.

### Testing & Connection Draining

*   You can test scaling by changing the desired capacity and observing how EC2 instances are launched or terminated.
    
*   **Connection Draining:** Ensures that ongoing requests are completed before an instance is fully removed. This prevents sudden failures for users.
    

Managing Permissions with IAM (Identity and Access Management)
--------------------------------------------------------------

IAM gives secure access to AWS services. You only pay for the services you use, and it helps you control what users can do in your AWS account.

*   **IAM User:** Represents a person or application. Has credentials (username/password or access keys).
    
*   **IAM Group:** A container for users; permissions are assigned to the group and inherited by all users in it.
    
*   **Policy:** A document (in JSON) that defines what actions are allowed or denied on AWS resources.