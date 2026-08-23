# Laboratory 02: Build the Cloud Infrastructure Blueprint

## Mission Overview
This lab simulates the planning phase of a cloud deployment for a fictional company,
CloudNova Technologies. Before any servers are deployed, I investigated a Linux server
running in the cloud (via KillerCoda), identified its core infrastructure components,
compared how the major public cloud providers offer equivalent services, and produced
technical documentation as if preparing a Cloud Infrastructure Assessment Report for
senior engineers.

## Objectives
- Explain the major components of cloud infrastructure
- Investigate the hardware and software resources available in a Linux environment
- Differentiate compute, storage, networking, and identity resources
- Interpret the relationship between cloud infrastructure components
- Create professional technical documentation using Markdown
- Continue building a structured GitHub Cloud Computing Portfolio

## Cloud Infrastructure Components
The server investigation identified four core component categories: **Compute**
(1-core Intel Xeon CPU, 1.9 GiB RAM), **Storage** (19 GB root disk plus separate
boot partitions), **Networking** (internal IP 172.30.1.2, hostname `ubuntu`), and
**Operating System** (Ubuntu 24.04.4 LTS). Full detail is in `cloud-components.md`.

## Tools Used
- KillerCoda Playground
- Linux terminal (bash)
- Draw.io
- Git / GitHub
- Markdown

## Linux Commands Executed
- `cat /etc/os-release`
- `uname -r`
- `lscpu | grep "Model name"`
- `nproc`
- `free -h`
- `df -h`
- `mount | column -t`
- `hostname`
- `ip addr show`

## Skills Learned
- Investigating a Linux server's hardware and OS configuration from the command line
- Mapping raw system information to cloud infrastructure concepts (compute, storage, networking)
- Comparing equivalent services across AWS, Azure, and GCP
- Structuring and writing professional technical documentation in Markdown
- Managing a GitHub portfolio with proper commit history and authentication (Personal Access Tokens)

## Challenges Encountered
Git initially rejected commits due to a missing local identity (`user.name`/`user.email`),
and pushing to GitHub failed because password authentication is no longer supported —
this required generating and using a Personal Access Token instead.
