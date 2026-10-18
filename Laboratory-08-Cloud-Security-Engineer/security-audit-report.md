# Security Audit Report

## Security Concepts (Chapter 8)

### The Principle of Least Privilege (PoLP)

The Principle of Least Privilege means giving users, applications, and services only the permissions they need to perform their tasks. This is important for cloud accounts because if an account is hacked or used incorrectly, the possible damage is limited. It also helps prevent mistakes, such as accidentally deleting important resources.

### Attack Surface

The attack surface of a virtual machine includes all the possible ways an attacker could access or exploit it. These include open ports, running services, installed programs, and user accounts. Having too many open ports or unnecessary services creates more opportunities for attacks. To reduce the attack surface, unused ports should be closed and unnecessary services or software should be removed.

### Default Deny Policy

A Default Deny policy blocks all network traffic unless it has been specifically allowed. This approach is safer than only blocking known attackers because attackers can change their IP addresses and use different methods. By denying traffic by default, unknown or unauthorized connections are blocked, while only approved traffic is allowed to pass through.
