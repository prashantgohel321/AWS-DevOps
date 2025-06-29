# 📁 FTP – File Transfer Protocol
- How files travel across networks

## 🚛 What is FTP?
- FTP (File Transfer Protocol) is a standard network protocol **used to transfer files between computers** — typically from a client to a server or vice versa.

- It’s been around since the early days of the internet, and it’s still used today — especially where simple, fast file transfers are needed.

---

<br>

## ⚙️ How FTP Works (Client-Server Model)
Client (you) initiates a connection to the FTP server

You can then:

- 📥 Download files

- 📤 Upload files

- 🧹 Rename, delete, or move files

👨‍💻 Example:

```bash
ftp ftp.example.com
```

---

<br>

## 🧾 Two Types of Access

| Type              | Description                                       |
| ----------------- | ------------------------------------------------- |
| **Anonymous**     | No username/password needed (read-only or public) |
| **Authenticated** | Requires credentials for private access           |

---

<br>

## 🔓 The Security Problem
❗ FTP is not secure — it sends data (including passwords) in plain text.

That means:

- Your credentials and files can be intercepted during transit.

- Not suitable for sensitive or confidential data.

---

<br>

## 🛡️ Secure Alternatives
| Protocol | Based On | Encryption Used | Port | Use Case                        |
| -------- | -------- | --------------- | ---- | ------------------------------- |
| **FTPS** | FTP      | SSL/TLS         | 990  | Secure FTP with certificates    |
| **SFTP** | SSH      | SSH encryption  | 22   | More secure + firewall-friendly |

> ✅ SFTP is widely preferred today — especially in DevOps workflows, CI/CD pipelines, and cloud environments.

---

<br>

## 💻 Real-World Use Cases
- Uploading static websites to a server

- Managing files on hosting services

- Transferring backups or logs

- Sending large files across teams

---

<br>

## 🧪 DevOps Tip: Try SFTP in Terminal
```bash
sftp user@server_ip
# Then use: put, get, ls, cd, etc.
```

---

<br>

## 🧠 Recap:
| Feature                | FTP                    | SFTP / FTPS            |
| ---------------------- | ---------------------- | ---------------------- |
| Protocol               | File Transfer Protocol | Secure (SSH/TLS based) |
| Encryption             | ❌ No                   | ✅ Yes                  |
| Port                   | 21                     | 22 (SFTP), 990 (FTPS)  |
| Secure for Production? | ❌ Not recommended      | ✅ Yes                  |

---

<br>

## 🔚 Final Thought
- FTP is like sending a file via postcard — quick, but exposed.

- SFTP is like using a locked envelope with tracking — secure and trusted.

> So whenever you’re building or managing infrastructure, always prefer SFTP for secure, encrypted file transfers.

---