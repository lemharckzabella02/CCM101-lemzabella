# Mission Reflection

**1. Which cloud infrastructure component do you think is the most important? Why?**

If I had to pick one, I'd say networking is the most important, because it's what
makes every other component actually usable in a cloud context. Compute and storage
can exist in isolation, but without networking, no one can reach the server, no data
can move between services, and no client can access an application. Networking is
also where a lot of security decisions live — deciding what's publicly exposed versus
internal — so getting it wrong has real consequences beyond just performance.

**2. How does Linux support cloud computing?**

Linux is the backbone of most cloud infrastructure because it's open-source, highly
configurable, and lightweight enough to run efficiently on shared virtualized
hardware. Nearly every major cloud provider offers Linux-based VM images, and most
container technology (like Docker, which I noticed was installed on my KillerCoda
server) is built on Linux kernel features like namespaces and cgroups. Being able to
inspect a server directly from the command line — checking CPU, memory, disk, and
network configuration — is a core skill for working with cloud infrastructure at all,
since much of it is managed without a graphical interface.

**3. Why is technical documentation important before deploying infrastructure?**

Documentation forces you to actually understand what you're working with before you
build on top of it. In this lab, writing down the server's specs and constraints (like
having only 1 CPU core and under 2 GiB of RAM) makes it obvious what kind of workloads
it could realistically support. Without that documentation, engineers deploying
services later would be working blind, more likely to over- or under-provision
resources, and have no record to refer back to if something breaks.

**4. What new skills did you learn during this laboratory activity?**

I learned how to pull system information directly from a Linux terminal using
commands like `lscpu`, `free -h`, `df -h`, and `ip addr show`, and how to translate
that raw output into structured technical documentation. I also ran into real Git
authentication issues — setting a missing git identity and generating a GitHub
Personal Access Token after password authentication was rejected — which was a
practical lesson in how cloud/dev tooling actually works outside of a tutorial.

**5. How has your GitHub portfolio improved after completing this mission?**

My portfolio now includes a second structured lab folder with proper documentation,
screenshots as evidence, and a real system investigation report, showing progression
from just setting things up in Lab 01 to actually analyzing and documenting
infrastructure. It also reflects a more professional workflow — organized files,
meaningful commit messages, and a consistent Markdown structure across documents.
