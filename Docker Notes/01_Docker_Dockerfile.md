# Dockerfile Concepts

## Dockerfile:

A text file containing a set of instructions that are used to automatically build a Docker image. It's essentially a blueprint for executing your containerized application, specifying everything from the base image to the app's dependencies and startup command.

## Common Instructions:

* **FROM**: Specifies the base image to build upon.

* **RUN**: Executes commands in the container during the build process.

* **COPY**: Copies files from the host machine to the container.

* **WORKDIR**: Sets the working directory for subsequent commands.

* **CMD vs. ENTRYPOINT**: Specifies the command to execute when the container starts.

## Dockerfile for Java App

```dockerfile
FROM openjdk:17-jdk-alpine #pull base image

WORKDIR /app #set working directory inside container

COPY . . #Copy source code from host to container

RUN javac Main.java # Compile: Program.

CMD ["java", "Main"] # Command to run when container starts
```

## CMD vs. ENTRYPOINT

| Feature | CMD | ENTRYPOINT | 
 | ----- | ----- | ----- | 
| Execution Time | At container start time | At container start time | 
| Purpose | Default command when container starts; can be overridden using `docker run` | Like CMD but not easily overridden. Forces the command to run, even with arguments. | 
| Overridable | Yes, easily with `docker run <image> <new_command>` | No, not easily. Arguments passed to `docker run` are appended to ENTRYPOINT. | 
| Build Time | No | No | 
| Install/Compile | No | No | 
| Example Usage | `CMD ["executable", "param1", "param2"]` | `ENTRYPOINT ["executable", "param1"]` | 

## Image Creation Process

1. **Dockerfile**

2. `docker build -t java-app .` (build the image from Dockerfile, `.` is the context)

3. `docker images` (list docker images)

4. `docker run java-app` (run image, starts container)

## Dockerfile for Python

```dockerfile
FROM Python:3.10-slim

WORKDIR /app

COPY . .

CMD ["python", "hello.py"]
```

## How to Access and Keep MySQL Container Running

### To get inside a running container:

To access a running container, use the `docker exec` command:
`docker exec -it <container_id_or_name> bash`

* `-i`: Interactive mode (keeps stdin open)

* `-t`: Allocates a pseudo-TTY (terminal access)

* `bash`: Launches the bash shell inside the container

### To exit the container shell and return to your host:

`>>> exit`

### Keeping containers running continuously:

`docker run -itd ubuntu`