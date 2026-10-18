Mission Reflection

1. How does a host-based firewall protect a server even if the network perimeter is breached?

A host-based firewall protects the server by filtering incoming and outgoing traffic directly on the machine. Even if an attacker gets past the network firewall or connects to the same network, the host firewall provides another layer of protection. This is an example of defense in depth, where multiple security measures help protect the system.

2. Why is managing open ports critical to reducing the attack surface?

Every open port can provide a way for attackers to reach a service running on the server. If a service has a vulnerability, attackers may exploit it to gain unauthorized access. By closing unnecessary ports and allowing only the required ones, such as SSH and port 8080 for a web application, I can reduce the server's attack surface and improve its security.

3. Why is it dangerous to leave a database port like 3306 open to the public internet?

Databases store sensitive information, such as customer records and login credentials. If MySQL port 3306 is publicly accessible, attackers can scan for it and attempt password attacks or exploit known vulnerabilities. This could result in stolen data or damage to the database. To reduce this risk, the database should only accept connections from trusted application servers over a private network.

4. How did this mission change my perspective on how easily a server can be compromised?

This mission helped me understand that a server can be exposed to security risks if its ports and services are not properly configured. I was surprised by how a simple command like ufw enable could change which connections were allowed to reach the server. I learned that even if a server is working correctly, it may still have security weaknesses. Proper firewall rules and regular security checks are important for keeping a server protected.

5. How does my GitHub portfolio look with eight completed missions?

My GitHub portfolio now shows my progress through eight completed missions, from learning cloud basics to deploying applications, managing systems, and improving server security. Each laboratory contains documentation and screenshots that demonstrate the work I have completed. I feel more confident because my portfolio shows the practical skills I have developed in Linux, Docker, cloud computing, and security. It also gives me a place to showcase my work and continue improving my technical knowledge.
