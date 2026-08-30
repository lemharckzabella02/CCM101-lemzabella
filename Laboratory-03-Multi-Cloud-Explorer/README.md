# CCM101 Laboratory Activity 3 - Multi-Cloud Explorer

## Linux System Investigation

### Operating System
Command: `uname -a`
Linux ubuntu 6.8.0-138-generic #138-Ubuntu SMP PREEMPT_DYNAMIC Fri Jul 31 22:41:49 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux

Command: `cat /etc/os-release`
PRETTY_NAME="Ubuntu 24.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.4 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian

Running Ubuntu 24.04.4 LTS ("Noble Numbat") on kernel 6.8.0, 64-bit architecture.

### CPU Information
Command: `lscpu`
- Architecture: x86_64
- CPU(s): 1
- Vendor ID: GenuineIntel
- Model name: Intel Xeon E312xx (Sandy Bridge, IBRS update)
- Thread(s) per core: 1
- Core(s) per socket: 1
- Socket(s): 1

Single vCPU (Intel Xeon E312xx, Sandy Bridge generation) — a lightweight, single-core virtual machine typical of a sandboxed playground environment.

### Memory
Command: `free -h`
- Total: 1.9Gi
- Used: 440Mi
- Free: 803Mi
- Available: 1.4Gi
- Swap: 1.0Gi (fully free)

Around 1.9 GiB of total RAM, with 1.4 GiB available — a small-footprint instance.

### Disk Space
Command: `df -h`
- /dev/vda1: 19G total, 5.4G used, 13G available (30% used) — mounted on /
- /dev/vda16: 881M total, 117M used, 703M available (15% used) — mounted on /boot
- /dev/vda15: 105M total, 6.2M used, 99M available (6% used) — mounted on /boot/efi

Root filesystem is 19 GB total with 13 GB available (30% used) — modest disk capacity suited for a lightweight VM, not a production workload.

## Cloud Migration Analysis

If this Linux server were migrated to the cloud, given its small specs (1 vCPU, ~2 GiB RAM, ~19 GB disk), it could be hosted on:

**AWS:** An EC2 t3.micro or t3.small instance closely matches this server's 1 vCPU / 2 GiB RAM profile, with an EBS gp3 volume covering the ~20 GB disk needs.

**Azure:** An Azure Virtual Machine using the B1s or B1ms burstable series would fit this workload, paired with a Standard SSD managed disk for storage.

**GCP:** A Compute Engine e2-small instance matches the CPU/RAM footprint well, using a Persistent Disk for the ~20 GB storage requirement.

Since this server is a small, low-resource Ubuntu instance, any of the three providers' entry-level "burstable" or "shared-core" VM tiers would be more than sufficient — this would be a straightforward lift-and-shift with no re-architecting needed.
