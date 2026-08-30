# Client Recommendations

## Client A – Startup Company
**Recommended Platform:** AWS

**Explanation:** Since the startup has a limited budget but expects rapid growth, AWS makes sense because of its pay-as-you-go pricing and strong free-tier options for getting started cheaply. It also scales easily as the company grows, so they won't need to re-architect their infrastructure later. AWS's massive ecosystem of tools also means they can find pre-built solutions instead of building everything from scratch.

**Services to use:**
1. EC2 — for hosting the mobile app's backend, scaling compute as user demand grows
2. S3 — for storing app assets like images and user uploads
3. RDS — for a managed database without needing a dedicated DBA

## Client B – University
**Recommended Platform:** Microsoft Azure

**Explanation:** Since the university already runs Windows Server, Microsoft 365, and Active Directory, Azure is the natural choice because it integrates directly with all of that existing infrastructure. Migrating to Azure means they can keep their current identity and access setup instead of rebuilding it elsewhere. This also reduces the learning curve for their IT staff, who are likely already familiar with Microsoft tools.

**Services to use:**
1. Azure Active Directory (Entra ID) — extends their existing AD setup into the cloud
2. Virtual Machines — for migrating existing Windows Server workloads
3. Azure SQL Database — for managed databases that fit into their current Microsoft stack

## Client C – AI Research Company
**Recommended Platform:** Google Cloud Platform

**Explanation:** Since this company builds AI/ML applications that need high-performance computing, GCP is the strongest fit because of its AI-focused tools and infrastructure originally built for Google's own machine learning workloads. GCP also created Kubernetes, so if the company needs to run containerized training jobs, GKE offers a very mature option. Their pricing for sustained compute workloads is also generally more competitive for research-heavy use cases.

**Services to use:**
1. Compute Engine — for running high-performance training workloads
2. Vertex AI — for building and deploying machine learning models
3. GKE (Google Kubernetes Engine) — for managing containerized ML pipelines at scale

## Client D – Global E-Commerce Company
**Recommended Platform:** AWS

**Explanation:** For a multinational e-commerce company needing high availability and automatic scaling, AWS is a strong fit thanks to its unmatched number of global regions and Availability Zones, which keeps the site fast and reliable everywhere. AWS's auto-scaling and load balancing tools are also mature and battle-tested for handling unpredictable traffic spikes, like during sales events. Its wide compliance certifications also help with operating across multiple countries.

**Services to use:**
1. EC2 with Auto Scaling — to handle traffic spikes automatically
2. CloudFront — for fast content delivery to customers worldwide
3. RDS (Multi-AZ) — for a highly available database setup across regions

## Multi-Cloud Decision Matrix (Checkpoint 6)

| Business Requirement | Recommended Platform | Justification |
|---|---|---|
| Startup Company | AWS | Flexible pricing and easy scalability for growing businesses |
| Enterprise Organization | AWS or Azure | Depends on existing tech stack; both offer mature enterprise tooling |
| Microsoft Environment | Azure | Native integration with Windows Server, AD, and Microsoft 365 |
| AI / Machine Learning | GCP | Strongest AI/ML tooling (Vertex AI, BigQuery) and compute options |
| Kubernetes Deployment | GCP | Created Kubernetes; GKE is the most mature managed offering |
| Global Web Application | AWS | Largest global infrastructure footprint for availability and scaling |
