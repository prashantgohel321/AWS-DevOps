<table border="2px solid">

<tr>
<td>11th August, 2025</td>
<td>Monday</td>
</tr>

</table>

## What is Prometheus?
Prometheus is **a tool that collects and stores information** about how your systems, applications, and servers are working. It **regularly checks different places for details** like CPU usage, memory usage, errors, or how fast something is running. It **saves this information over time** so you can see both the current state and the past performance.

## What is Grafana?
Grafana is **a tool that takes the information from Prometheus and shows it in a clear and visual way**, such as graphs, charts, and dashboards. This makes it **much easier to understand the data and spot** if something is going wrong or improving.

## When used in Docker, 
**Prometheus** runs inside one container **to collect the data**. **Grafana** runs in another container **to display that data**. They **communicate with each other** using network connections provided by Docker. Instead of **`localhost`**, we often use **`host.docker.interna`l** so **containers can talk to the host machine or each other properly**.

## Why Prometheus and Grafana are required
Imagine you manage an online clothing store. Your website, payment service, database, and shipping system are **all running on different servers or containers**. At any time, something could slow down or fail — maybe the payment system gets stuck, the database uses too much memory, or the website crashes under heavy traffic.

**Prometheus** will **automatically check all these systems every few seconds and record their performance and health**. It will store data like “CPU is 85%”, “Database took 2 seconds to respond”, or “Number of failed logins in the last minute”.

**Grafana** will **take this data and show you on a live dashboard with graphs and alerts**. This way, you can quickly notice that the payment system is slow, or the website load is high, and take action before customers complain.

> Without these tools, you’d only know something is wrong when customers start calling — which is too late.

<br>

## Why not use localhost inside Docker
In Docker, localhost inside a container means “**this container itself**”, not your real computer or other containers.

**Real-world example**:
Let’s say **Prometheus** is in one Docker container and **Grafana** is in another. If you tell Grafana to get data from **`localhost:9090`**, **Grafana will look for Prometheus inside its own container** — but Prometheus is in a different container, so it won’t find it.

Instead, we use something like **`host.docker.internal`** or the **container’s network name** so Grafana can connect to Prometheus correctly. It’s like sending a letter — if you write “my house” as the address, the postman will think you mean his own house, not yours. You have to write the proper address so it reaches the right place.

If you use localhost inside the Grafana container,

- It will point to Grafana’s own container environment, not your host machine or other containers.

- So, if Prometheus is not running inside the same Grafana container, Grafana won’t find it.

Now:

- If Prometheus is on your host machine (outside Docker), you use host.docker.internal so the Grafana container can reach the host machine.

- If Prometheus is in another container, the better practice is to use a Docker network and connect using the container name (e.g., prometheus:9090), not host.docker.internal.

When I say "**Prometheus is on the host**", I mean you installed and are running Prometheus directly on your computer’s operating system (host machine) — not inside a Docker container.

<br>
<br>

## Option 1 — Using a Shared Docker Network
#### Best practice: containers can talk to each other using container names.

```bash
docker network create monitoring -d bridge

docker run -d --name prometheus --network monitoring -p 9090:9090 prom/prometheus:latest 

docker run -d --name prometheus --network monitoring -p 9090:9090 prom/prometheus:latest 

# Grafana Data Source URL:
http://prometheus:9090
```
> Here, prometheus is the container name, resolvable via Docker's internal DNS because both containers share the same network.

<br>
<br>

## Option 2 — Using host.docker.internal
#### For when containers are not on the same Docker network, but Prometheus is still accessible via a published port.
```bash
docker run -d --name prometheus -p 9090:9090 prom/prometheus:latest 

docker run -d --name prometheus -p 9090:9090 prom/prometheus:latest 

# Grafana Data Source URL:
http://host.docker.internal:9090
```

> Here, host.docker.internal lets Grafana reach the host machine’s network, which then forwards the request to Prometheus via the exposed 9090 port.