# Linux Volume Management

## List of Contents
* <a href="#intro_volumes_ebs">01 Introduction to Linux Volumes and AWS EBS</a>
    * <a href="#real_world_scenario">01.01 Real-World Scenario</a>
    * <a href="#what_is_a_volume">01.02 What is a Volume?</a>
    * <a href="#what_is_aws_ebs">01.03 What is AWS EBS (Elastic Block Store)?</a>
    * <a href="#hands_on_create_attach">01.04 Hands-On: Create Volumes & Attach to EC2</a>
        * <a href="#create_ec2_instance">01.04.01 Create an EC2 Instance</a>
        * <a href="#connect_to_ec2">01.04.02 Connect to EC2 via SSH</a>
        * <a href="#check_existing_volumes">01.04.03 Check Existing Volumes (Root Disk)</a>
        * <a href="#view_disk_usage">01.04.04 View Disk Usage</a>
        * <a href="#what_does_mount_mean">01.04.05 What Does “Mount” Mean?</a>
    * <a href="#add_extra_volumes">01.05 Add Extra Volumes (10GB, 12GB, 14GB)</a>
        * <a href="#create_ebs_volumes">01.05.01 Create EBS Volumes</a>
        * <a href="#attaching_volumes_to_ec2">01.05.02 Attaching Volumes to EC2</a>
        * <a href="#verify_volume_attachment">01.05.03 Verify Volume Attachment</a>
* <a href="#physical_logical_volume_groups">02 Physical vs Logical Volumes vs Volume Groups in Linux</a>
    * <a href="#lvm_context">02.01 Context: You’ve Attached Extra Disks… Now What?</a>
    * <a href="#what_is_lvm">02.02 What is LVM?</a>
    * <a href="#step_by_step_lvm">02.03 Step-by-Step LVM Process (With Commands)</a>
        * <a href="#lvm_step_1_root">02.03.01 Step 1: Become Root User</a>
        * <a href="#lvm_step_2_pv">02.03.02 Step 2: Create Physical Volumes</a>
        * <a href="#lvm_step_3_vg">02.03.03 Step 3: Create a Volume Group (VG)</a>
        * <a href="#lvm_step_4_lv">02.03.04 Step 4: Create Logical Volumes (LV)</a>
        * <a href="#lvm_bonus_display">02.03.05 Bonus: Display Commands (For Debugging)</a>
        * <a href="#lvm_summary_workflow">02.03.06 Summary of LVM Workflow</a>
* <a href="#mounting_volumes_lvm">03 Mounting Volumes in Linux (LVM)</a>
    * <a href="#mounting_recap">03.01 Recap Before Mounting</a>
    * <a href="#why_not_showing_df_h">03.02 Why Isn’t My Volume Showing in df -h?</a>
    * <a href="#step_by_step_mount_lv">03.03 Step-by-Step: Mount a Logical Volume</a>
        * <a href="#mount_lv_verify">03.03.01 1. Verify the Logical Volume</a>
        * <a href="#mount_lv_create_mount_point">03.03.02 2. Create a Mount Point</a>
        * <a href="#mount_lv_format">03.03.03 3. Format the Logical Volume</a>
        * <a href="#mount_lv_mount">03.03.04 4. Mount the Volume</a>
        * <a href="#mount_lv_check_mounted">03.03.05 5. Check If It’s Mounted</a>
    * <a href="#test_it">03.04 Let’s Test It</a>
    * <a href="#diff_attached_mounted">03.05 Difference Between Attached vs Mounted Volume</a>
    * <a href="#unmount_remount">03.06 How to Unmount and Remount</a>
    * <a href="#mounting_summary">03.07 Summary (Mounting)</a>
* <a href="#managing_ebs_no_lvm">04 Managing AWS EBS on EC2 Instances (Without LVM)</a>
    * <a href="#step_by_step_mount_ebs_no_lvm">04.01 Step-by-Step: Mount EBS Volume Without LVM</a>
        * <a href="#mount_ebs_no_lvm_mkdir">04.01.01 1. Create a Mount Directory</a>
        * <a href="#mount_ebs_no_lvm_format">04.01.02 2. Format the Volume</a>
        * <a href="#mount_ebs_no_lvm_mount">04.01.03 3. Mount the Disk</a>
    * <a href="#summary_ebs_no_lvm">04.02 Summary: EBS Without LVM</a>
* <a href="#lvm_ebs_dynamic">05 Using LVM with EBS for Dynamic Storage Management</a>
    * <a href="#extend_lv">05.01 How to Extend a Logical Volume (LV)</a>
    * <a href="#resize_filesystem">05.02 Important: Resize the Filesystem Too</a>
    * <a href="#final_check_extend">05.03 Final Check (Extend)</a>
    * <a href="#final_thoughts">05.04 Final Thoughts</a>

---

<section id="intro_volumes_ebs">

# Introduction to Linux Volumes and AWS EBS

<section id="real_world_scenario">

### 🚀 Let's Start With a Real-World Scenario:
Imagine you're launching an EC2 instance on AWS — basically, your personal cloud server. Now, when you want to store files or run applications, you’ll need storage space, right?

In Linux (and AWS), that storage is called a volume.
Think of it as a virtual hard disk.

</section>

<section id="what_is_a_volume">

### 🗃️ What is a Volume?
When you create an EC2 instance, AWS gives you default storage (usually 8 GB) — this is called the root volume.
But as your application grows (logs, user data, backups), you’ll need more space.

> 💡 That’s where extra volumes come in — we create additional disks and attach them to the instance.

</section>

<section id="what_is_aws_ebs">

### 📦 What is AWS EBS (Elastic Block Store)?
AWS EBS is a service that lets you create extra storage volumes and attach them to your EC2 instance.

> Think of EC2 as a computer and EBS volumes as external pen drives or hard disks you plug into it.

</section>

---

<section id="hands_on_create_attach">

### 🛠️ Hands-On: Create Volumes & Attach to EC2

<section id="create_ec2_instance">

#### 1️⃣ Create an EC2 Instance
- Go to AWS EC2 console
- Choose Ubuntu as the OS
- Select instance type: t2.micro
- Create or use an existing key pair (used for SSH login)
- Allow SSH (port 22) in the security group (very important!)
- In storage section: default 8 GB is pre-set (root volume)
- Launch the instance ✅

</section>

<section id="connect_to_ec2">

#### 2️⃣ Connect to EC2 via SSH
- Download the .pem key file
- Open terminal and run:

```bash
chmod 400 your-key.pem
ssh -i your-key.pem ubuntu@<your-ec2-ip>
```
- 🎉 You’re now inside your cloud server!

</section>

<section id="check_existing_volumes">

🔍 Check Existing Volumes (Root Disk)
Run:

```bash
lsblk
```
This shows all attached volumes:

```pgsql
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
```xvda` → Your main/root volume (disk)

`xvda1` → Partition of the root volume

`/` → Means it’s mounted to root of the file system

</section>

<section id="view_disk_usage">

#### 📊 View Disk Usage
Run:

```bash
df -h
```
This shows used/free space:
```nginx
Filesystem       Size Used Avail Use% Mounted on
/dev/root        7.8G  1.6G  6.0G  22% /
```

</section>

<section id="what_does_mount_mean">

### 🤔 What Does “Mount” Mean?
“Mounting” means connecting a volume to a directory path in Linux.

So when your volume is mounted to /, it means that Linux is reading/writing to it via that location.

</section>
</section>

---

<section id="add_extra_volumes">

### 🔗 Now, Let’s Add Extra Volumes (10GB, 12GB, 14GB)

<section id="create_ebs_volumes">

#### 1. Go to “Elastic Block Store” → “Volumes”
Click “Create Volume”
- Type: General Purpose (gp2)
- Size: 10 GB (similarly repeat for 12 GB & 14 GB)
- Availability Zone: must match your EC2’s zone (e.g., ap-south-1a)
- Click Create Volume

> 🔁 Repeat for 12 GB and 14 GB volumes.

</section>

<section id="attaching_volumes_to_ec2">

### 🔌 Attaching Volumes to EC2
For each volume:
- Click → Actions → Attach Volume
- Select your EC2 Instance
```
- Set Device Name as /dev/sdf (first one), then /dev/sdg, /dev/sdh

💡 Don't use /dev/sdb, /dev/sdc, etc. — those are usually reserved for system use.
```

</section>

<section id="verify_volume_attachment">

### ✅ Verify Volume Attachment
Run:

```bash
lsblk
```
You’ll now see:

```arduino
NAME   8G   ← root disk
xvdf  10G   ← attached EBS
xvdg  12G
xvdh  14G
```
> 👉 But notice: their MOUNTPOINT is empty — this means they’re attached but not mounted yet.

</section>
</section>

---

<section id="physical_logical_volume_groups">

# Physical vs Logical Volumes vs Volume Groups in Linux
<section id="lvm_context">

### 💡 Context: You’ve Attached Extra Disks… Now What?
In the previous steps, you added 3 extra volumes (10 GB, 12 GB, and 14 GB) to your EC2 instance. But right now, they’re just raw blocks of storage — like unformatted pen drives.

To use them properly, Linux uses a smart system called LVM — Logical Volume Manager.

</section>

---

<section id="what_is_lvm">

### What is LVM?
| LVM Layer          | Real-World Analogy                            |
| :---------------- | :------------------------------------------------ |
| Physical Volume (PV) | Raw bricks (your disk space)                    |
| Volume Group (VG) | A big room made by combining bricks             |
| Logical Volume (LV) | Separate cabins (partitions) built in room      |

</section>

---

<section id="step_by_step_lvm">

## 🔹 Step-by-Step LVM Process (With Commands)
<section id="lvm_step_1_root">

### 🔑 Step 1: Become Root User
You’ll need root permissions to use LVM. You can either run sudo before each command or switch to root:

```bash
sudo su
lvm   # optional: drops into LVM shell
```

</section>

<section id="lvm_step_2_pv">

### 📌 Step 2: Create Physical Volumes
Right now your new disks (/dev/xvdf, /dev/xvdg, /dev/xvdh) are not usable by LVM — we need to convert them to Physical Volumes (PV).

```bash
pvcreate /dev/xvdf /dev/xvdg /dev/xvdh
# ✅ This tells Linux: “These disks are ready to be managed by LVM.”
```

You can verify:

```bash
pvs
```

</section>

<section id="lvm_step_3_vg">

### 🧱 Step 3: Create a Volume Group (VG)
Now combine some physical volumes into a Volume Group (VG). For example:

```bash
vgcreate my_vg /dev/xvdf /dev/xvdg

# This creates a Volume Group named my_vg with 10 GB + 12 GB = 22 GB.
```

Check with:

```bash
vgs

# It will show:
# - Volume Group name
# - Size
# - Number of PVs and LVs inside it
```

</section>

<section id="lvm_step_4_lv">

### 📦 Step 4: Create Logical Volumes (LV)
Now let’s cut out a slice from that VG and create a Logical Volume (LV) — say, a 10 GB slice:

```bash
lvcreate -L 10G -n my_lv my_vg

# -L = size of logical volume
# -n = name of logical volume
# my_vg = the group from which this slice is carved out
```

Verify:
```bash
lvs
```

</section>

<section id="lvm_bonus_display">

### 🧾 Bonus: Display Commands (For Debugging)
Show physical volume info:

```bash
pvdisplay
```

Show volume group details:

```bash
vgdisplay
```
Show logical volume details:

```bash
lvdisplay
```

</section>

<section id="lvm_summary_workflow">

### 📌 Summary of LVM Workflow
```text
1. pvcreate       → Make raw disks usable by LVM
2. vgcreate       → Combine PVs into a volume group
3. lvcreate       → Create partitions (LVs) from the VG
```

#### At this point, your logical volume (like /dev/my_vg/my_lv) is ready — but you can’t use it yet. You still need to:

1. Format it
2. Mount it to a folder

</section>
</section>

---

<section id="mounting_volumes_lvm">

# Mounting Volumes in Linux (LVM)
<section id="mounting_recap">

### 🧠 Recap Before Mounting:
You’ve already created:
- ✅ Physical Volumes (pvcreate)
- ✅ Volume Group (vgcreate)
- ✅ Logical Volume (lvcreate)

Now it’s time to make the Logical Volume usable — and that’s where mounting comes in.

</section>

---

<section id="why_not_showing_df_h">

### ❓ Why Isn’t My Volume Showing in df -h?
If you run:

```bash
lsblk

# You’ll see your disks and LVM layout like /dev/xvdf, /dev/my_vg/my_lv.
```

But if you run:
```bash
df -h

👉 You won’t see your new volume here yet — because it’s not mounted.
```

</section>

---

<section id="step_by_step_mount_lv">

## 🧱 Step-by-Step: Mount a Logical Volume
<section id="mount_lv_verify">

### 🔍 1. Verify the Logical Volume
```bash
lvs

# Make sure your LV (e.g., my_lv) exists inside your VG (e.g., my_vg).
```

</section>

<section id="mount_lv_create_mount_point">

### 📁 2. Create a Mount Point
Think of this as a folder where your volume will be plugged in:
```bash
mkdir /mnt/my_mount
```

</section>

<section id="mount_lv_format">

### 🧹 3. Format the Logical Volume
Before mounting, you need to create a filesystem (e.g., EXT4) on the volume:

```bash
mkfs.ext4 /dev/my_vg/my_lv

#⚠️ This will erase everything on the volume, just like formatting a pen drive.
```

</section>

<section id="mount_lv_mount">

### 📌 4. Mount the Volume
Now bind (mount) the LV to your mount folder:

```bash
mount /dev/my_vg/my_lv /mnt/my_mount
# ✅ Now your storage is usable from that folder!
```

</section>

<section id="mount_lv_check_mounted">

### ✅ 5. Check If It’s Mounted
```bash
df -h

# You’ll see a new line like:

/dev/mapper/my_vg-my_lv   10G   50M   9.9G   1% /mnt/my_mount

# 🎉 Success! The volume is now mounted and ready to store files.
```

</section>
</section>

---

<section id="test_it">

### 📂 Let’s Test It
Go inside the mount directory:

```bash
cd /mnt/my_mount
echo "Hello from LVM!" > test.txt
cat test.txt

# 💡 If you see the content, it means your mounted volume is working perfectly.
```

</section>

<section id="diff_attached_mounted">

### ❓ Difference Between Attached vs Mounted Volume

| Concept      | Meaning                                           |
| ------------ | --------------------------------------------------- |
| **Attached** | Disk is plugged into the system (via AWS EBS, etc.) |
| **Mounted** | Disk is connected to a directory and can be used    |

> 👉 Attached is like plugging in a USB drive

> 👉 Mounted is like opening it and starting to use it

</section>

---

<section id="unmount_remount">

### 🔌 How to Unmount and Remount
🛑 Unmount:
```bash
umount /mnt/my_mount
```

If you now try:

```bash
cat /mnt/my_mount/test.txt
```
❌ You won’t be able to access it (because it’s unmounted). But don’t worry — your data is safe.

🔁 Remount:
```bash
mount /dev/my_vg/my_lv /mnt/my_mount
# Now the file is back!
```

</section>

---

<section id="mounting_summary">

### 🧠 Summary
- lsblk shows block devices
- df -h shows mounted filesystems
- mkfs.ext4 formats the LV
- mount makes it usable
- You can store files, read them, unmount, remount — your data will remain safe on disk

</section>
</section>

---

<section id="managing_ebs_no_lvm">

# 💾 Managing AWS EBS on EC2 Instances (Without LVM)
🎯 Objective: Mount an AWS EBS Volume without using LVM
So far, you've used LVM to manage storage. But what if you just want to use an EBS volume directly, like a plug-and-play hard disk?

Let’s say you have one unused volume left: /dev/xvdh (14 GB). Let’s mount it directly to your EC2 instance.

---

<section id="step_by_step_mount_ebs_no_lvm">

## 🔧 Step-by-Step: Mount EBS Volume Without LVM
<section id="mount_ebs_no_lvm_mkdir">

### 📁 1. Create a Mount Directory
Create a folder where you want to mount the disk:
```bash
mkdir /mnt/new_disk_mount

# So now in /mnt/, you’ll have:
/mnt/new_lv_mount ← for LVM-managed volume
/mnt/new_disk_mount ← for directly-mounted EBS disk
```

</section>

<section id="mount_ebs_no_lvm_format">

### 🧹 2. Format the Volume
Before using a raw disk, you must format it and apply a file system.

```bash
mkfs -t ext4 /dev/xvdh

# mkfs: Make filesystem
# -t ext4: Choose file system type (EXT4 is default and most used in Linux)
# ⚠️ This will wipe the disk clean!
```

</section>

<section id="mount_ebs_no_lvm_mount">

### 🔗 3. Mount the Disk
Now mount the volume (bind it to the directory):

```bash
mount /dev/xvdh /mnt/new_disk_mount
```
Now it's ready to use. Check it:
```bash
df -h
```
You’ll see something like:
```bash
/dev/xvdh   14G  24M  13.9G   1% /mnt/new_disk_mount
```
✅ You can now create files inside /mnt/new_disk_mount and use the disk like normal storage!

</section>
</section>

---

<section id="summary_ebs_no_lvm">

### 💡 Summary: EBS Without LVM
| Feature          | With LVM                            | Without LVM                             |
| ---------------- | --------------------------------- | ----------------------------------------- |
| Disk flexibility | Extend/Shrink volumes dynamically | Fixed size, no flexibility                |
| Setup complexity | Higher (PV, VG, LV setup needed)  | Very simple (just format & mount)         |
| Use case         | Dynamic apps, servers, scaling    | Simple static storage (logs, media, etc.) |

</section>
</section>

---

<section id="lvm_ebs_dynamic">

### 🔄 Using LVM with EBS for Dynamic Storage Management
Now let’s say your app is growing and you need more storage on an LVM volume — LVM makes this easy.

<section id="extend_lv">

### 🔧 How to Extend a Logical Volume (LV)
Let’s assume your volume group still has free space. To add 5 GB more to your logical volume:

```bash
lvextend -L +5G /dev/new_vg/new_lv

# -L +5G: Add 5 GB to existing size
# /dev/new_vg/new_lv: Your target LV

✅ This extends the volume at the LVM level.
```

</section>

---

<section id="resize_filesystem">

### 📢 Important: Resize the Filesystem Too
After extending the LV, you must tell the file system to use the new space:

```bash
resize2fs /dev/new_vg/new_lv
```
Without this, your file system will still act like it’s using the old size!

</section>

<section id="final_check_extend">

### ✅ Final Check
```bash
df -h
```
You’ll see that the /mnt/new_lv_mount volume now shows the increased space.

</section>

<section id="final_thoughts">

### 🔚 Final Thoughts
- LVM is powerful for managing growing applications or dynamic storage.
- Direct EBS volumes are quick and simple, great for static use cases.
- Combine both depending on your DevOps need and system architecture.

</section>
</section>
