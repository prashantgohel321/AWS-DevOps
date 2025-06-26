# 🚀 Script: create_ec2.sh

Automates the creation of an AWS EC2 instance using AWS CLI with error handling and verification.

---

## 🧱 First Line – Safety Setup

```bash
#!/bin/bash
set -euo pipefail
```

### What it does

- set -e: Exit on any command failure
- set -u: Exit if using an undefined variable
- set -o pipefail: Catch errors in piped commands

> 🔐 This makes your script safe and production-grade.

---

## ✅ Function 1: Check if AWS CLI is Installed

```bash
check_awscli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it first." >&2
        exit 1
    fi
}
```

### 🔍 What it does

- Checks if aws command is available
- If not, it prints error to stderr (>&2) and exits

---

## ⚙️ Function 2: Install AWS CLI

```bash
install_awscli() {
    echo "Installing AWS CLI v2 on Linux..."

    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo apt-get install -y unzip &> /dev/null
    unzip -q awscliv2.zip
    sudo ./aws/install

    aws --version
    rm -rf awscliv2.zip ./aws
}
```

### 🛠 What it does

- Downloads AWS CLI v2
- Installs unzip silently (&> /dev/null)
- Unzips and installs AWS CLI
- Verifies the installation
- Cleans up the downloaded files

### ❌ Potential Errors:

- No internet connection
- Permission denied
- Install path issues

> ⚠️ You could add || return 1 or a trap here for more resilience.

---

## ⏳ Function 3: Wait for EC2 Instance to Be Running

```bash
wait_for_instance() {
    local instance_id="$1"
    echo "Waiting for instance $instance_id to be in running state..."

    while true; do
        state=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].State.Name' --output text)
        if [[ "$state" == "running" ]]; then
            echo "Instance $instance_id is now running."
            break
        fi
        sleep 10
    done
}
```

### 🔁 What it does

- Polls the EC2 instance status every 10 seconds
- Once it's in running state → break the loop

### ❌ Errors it handles

- Race condition where the instance is still in pending state
- AWS CLI returning intermediate states
- You could enhance this by adding a timeout or logging retries.

---

## ☁️ Function 4: Create EC2 Instance

```bash
create_ec2_instance() {
    local ami_id="$1"
    local instance_type="$2"
    local key_name="$3"
    local subnet_id="$4"
    local security_group_ids="$5"
    local instance_name="$6"

    instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --key-name "$key_name" \
        --subnet-id "$subnet_id" \
        --security-group-ids "$security_group_ids" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \
        --query 'Instances[0].InstanceId' \
        --output text
    )

    if [[ -z "$instance_id" ]]; then
        echo "Failed to create EC2 instance." >&2
        exit 1
    fi

    echo "Instance $instance_id created successfully."
    wait_for_instance "$instance_id"
}
```

### 🔧 What it does

- Calls aws ec2 run-instances with given parameters
- Tags the instance
- Captures the instance ID
- Validates the ID (if empty → error)
- Waits until it's in running state

### ❌ Errors handled

- Missing AMI ID, invalid subnet or SGs
- Empty instance_id response
- Improper permissions or expired credentials

> ⚠️ You can validate inputs ($1 to $6) at the start of the function.

---

## 🧠 Main Function

```bash
main() {
    check_awscli || install_awscli

    echo "Creating EC2 instance..."

    AMI_ID=""
    INSTANCE_TYPE="t2.micro"
    KEY_NAME=""
    SUBNET_ID=""
    SECURITY_GROUP_IDS=""
    INSTANCE_NAME="Shell-Script-EC2-Demo"

    create_ec2_instance "$AMI_ID" "$INSTANCE_TYPE" "$KEY_NAME" "$SUBNET_ID" "$SECURITY_GROUP_IDS" "$INSTANCE_NAME"

    echo "EC2 instance creation completed."
}
```

### 🎯 What it does

- Verifies or installs AWS CLI
- Defines instance parameters
- Calls create_ec2_instance with those parameters

> ⚠️ Errors not handled here: <br>
Empty AMI ID, KEY_NAME, SUBNET_ID, etc.

### 💡 You can add

```bash
if [[ -z "$AMI_ID" || -z "$KEY_NAME" || -z "$SUBNET_ID" ]]; then
  echo "Required fields missing!"
  exit 1
fi
```

---

## 🏁 Final Line

```bash
main "$@"
```

### Runs the main() function

- Passes any CLI arguments ($@) to main, even though not used here (future-proofing!)
