# Cloud Infrastructure Components

## Compute Resources

**Purpose:** Compute resources are the processing power — CPU and memory — that actually
run applications, execute code, and handle workloads. In a cloud environment, this is
what you're renting when you spin up a virtual machine or container instance.

**Why it matters in cloud computing:** Compute is the core billable resource in most
cloud services. Providers let you scale compute up or down based on demand (vertical
scaling by choosing a bigger instance, or horizontal scaling by adding more instances),
so you only pay for the processing power you actually need at a given time.

**In this environment:** The KillerCoda server I was assigned runs on a single-core
Intel Xeon E312xx CPU with 1.9 GiB of RAM. This reflects a minimal compute tier — typical
of a lightweight sandbox/training instance rather than a production workload, which
would usually be provisioned with more cores and memory depending on the application's
needs.

## Storage Resources

**Purpose:** Storage resources hold persistent data — files, databases, logs — that
needs to survive beyond a single running process or reboot.

**Why it matters in cloud computing:** Cloud storage decouples data from compute,
meaning a server can be destroyed and recreated without losing data, as long as it's
attached to persistent storage (like a cloud disk or object storage bucket). This
separation is central to how cloud elasticity and disaster recovery work.

**In this environment:** My server has 19 GB of disk on the root filesystem (`/dev/vda1`,
ext4), with 5.4 GB used and 13 GB available (30% utilization), plus separate smaller
partitions for `/boot` (881M) and `/boot/efi` (105M). Splitting boot-related partitions
from the main filesystem is a common cloud VM disk layout pattern.

## Networking Resources

**Purpose:** Networking resources connect systems to each other and to the internet —
this includes IP addressing, routing, firewalls, and virtual network interfaces.

**Why it matters in cloud computing:** Networking is what allows cloud resources to
communicate securely and be reached by users. It also defines security boundaries (e.g.
which resources are publicly accessible vs. isolated in a private network), which is
critical for both functionality and security in a cloud deployment.

**In this environment:** The server has hostname `ubuntu` and is reachable on the
internal network at `172.30.1.2/24` via the `enp1s0` interface. It also has a loopback
interface (`127.0.0.1`) and a `docker0` bridge interface (`172.17.0.1/16`), indicating
Docker networking is available on this host even though no containers were running
during this investigation.

## Operating System

**Purpose:** The operating system manages hardware resources, schedules processes,
handles file systems, and provides the runtime environment that applications and
services depend on.

**Why it matters in cloud computing:** The OS is the foundation every cloud workload
runs on top of. Its version affects compatibility, available packages, security patch
level, and kernel-level features (like container support). Cloud providers typically
offer a choice of OS images so customers can match their software stack requirements.

**In this environment:** The server runs Ubuntu 24.04.4 LTS (Noble Numbat) on kernel
6.8.0-138-generic — a current long-term-support release, which in a real cloud context
would matter for security patching and long-term maintenance stability.
