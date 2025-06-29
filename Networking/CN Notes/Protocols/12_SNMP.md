# 📡 SNMP – Simple Network Management Protocol
- Your network’s “health check” system

## 🔍 What is SNMP?
- SNMP is a network protocol used to monitor, manage, and configure devices on a network like routers, switches, firewalls, and servers.

It’s how network admins get answers to questions like:

- Is this router up or down?

- What’s the CPU usage on that switch?

- How many packets were dropped today?

---

<br>

## 🧠 Real-Life Analogy
Imagine your network devices are employees.
SNMP is the manager that regularly asks:

> “How are you doing?” <br>
> And devices reply with health updates.

---

<br>

## 🧪 How SNMP Works (Simply):
SNMP follows a client-server model:

- **Agents**: These run on your network devices (like routers, switches)

- **NMS (Network Management System)**: This is the central tool that polls or receives data from agents

🧭 There are 3 core operations:
| Operation | Purpose                              |
| --------- | ------------------------------------ |
| `GET`     | Ask the device for a specific metric |
| `SET`     | Change a configuration on the device |
| `TRAP`    | Device sends an alert automatically  |

---

<br>

## 🧰 Real-World Example:
The agent on a router sends its CPU, memory, and traffic stats to a central NMS like:

- Zabbix

- Nagios

- PRTG

- SolarWinds

These tools then visualize the data for you and raise alerts when something’s wrong.

---

<br>

## 🔒 SNMP Versions
| Version | Security         | Notes                             |
| ------- | ---------------- | --------------------------------- |
| SNMPv1  | 🚫 No encryption | Old and outdated                  |
| SNMPv2  | 🚫 No encryption | Adds bulk data support            |
| SNMPv3  | ✅ Encrypted      | Secure, recommended in production |


---

<br>

## ⚙️ DevOps & Cloud Relevance
- Helps monitor on-premise infrastructure

- Used with tools like Prometheus exporters

- Useful for hybrid environments (on-prem + AWS)

- Supports alerting systems (e.g., high CPU or downed servers)

---

<br>

## ✅ Summary
| Feature              | SNMP                               |
| -------------------- | ---------------------------------- |
| Full Form            | Simple Network Management Protocol |
| Layer                | Application layer                  |
| Purpose              | Monitor & manage network devices   |
| Devices Managed      | Routers, switches, servers         |
| Key Operations       | GET, SET, TRAP                     |
| Common Ports         | 161 (query), 162 (trap)            |
| Version to Use Today | SNMPv3                             |

---

<br>

## 💡 Final Thought:
- SNMP is the eyes and ears of your network.
- It constantly watches over your devices and notifies you before things go wrong — like a health monitoring system for your digital infrastructure.

---