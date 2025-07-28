# Monitoring & Logging in Docker

## Running a Flask App in Docker
To run a Flask app container in the background on port 80:
```bash
docker run -d -p 80:80 flask-app:latest
```

- `-d`: Detached mode (runs the container in the background)

- `-p`: Maps port 80 of your host to port 80 of the container.

## Viewing Logs
To view logs from a running container:
```bash
docker logs <container_id>
```

This will display the stdout and stderr output from the container.

You can also follow logs in real-time:
```bash
docker logs -f <container_id>
```

## Redirect Logs to a File (Background Logging)
If you want to redirect container logs to a file and keep the process running in the background:
```bash
nohup docker attach <container_id> &
```

- `nohup`: Runs the command without hanging up, even if the terminal is closed

- `docker attach`: Attaches your terminal to a running container’s output

- `&`: Runs the command in the background

- Output is automatically saved to `nohup.out` file by default

## Notes:
This is useful for persisting logs for later inspection

For production setups, it’s better to use centralized logging tools like:

- ELK Stack (Elasticsearch, Logstash, Kibana)

- Prometheus + Grafana

- Fluentd, Loki, or Loggly