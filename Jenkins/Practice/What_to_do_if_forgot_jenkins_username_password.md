<details>
<summary>
<strong>
Option 1: Check the Initial Admin Password (first-time setup only)
</strong>
</summary>
<br>

When Jenkins is installed the first time, it generates a password at:
```bash
/var/jenkins_home/secrets/initialAdminPassword
```

If you never changed the admin credentials, you can get it from Docker:
```bash
docker exec -it <jenkins_container_id> cat /var/jenkins_home/secrets/initialAdminPassword
```

Then go to **`http://localhost:8080`** and login with:

- Username: admin

- Password: (the value from above)

</details>

<br>
<br>

<details>
<summary>
<strong>
Option 2: Reset Password via Script Console
</strong>
</summary>
<br>

If you lost a custom user password:

1. Exec into Jenkins container:
```bash
docker exec -it <jenkins_container_id> bash
```

2. Edit Jenkins config file (config.xml) located at:
```bash
/var/jenkins_home/users/<your-username>/config.xml
```

> → You can reset password hash or delete the user entry.
(A bit messy, not the easiest way for beginners.)

</details>

<br>
<br>

<details>
<summary>
<strong>
Option 3: Disable Security (Reset Admin)
</strong>
</summary>
<br>

If totally locked out, you can temporarily disable security:

1. Stop Jenkins container:
```bash
docker stop <jenkins_container_id>
```

2. Edit config.xml (inside /var/jenkins_home/ on your mounted volume).
Find this line:

```bash
<useSecurity>true</useSecurity>
```
Change it to:
```bash
<useSecurity>false</useSecurity>
```

3. Restart Jenkins:
```bash
docker start <jenkins_container_id>
```

4. Now Jenkins will open without login → create a new admin user.

5. Re-enable security afterward.

</details>

<br>
<br>

