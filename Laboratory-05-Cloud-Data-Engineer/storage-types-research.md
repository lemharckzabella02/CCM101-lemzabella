# Types of Cloud Storage

## Comparison Table

| Storage Type | Description (How it stores data) | Primary Use Case | Cloud Provider Example |
|---|---|---|---|
| **Block Storage** | Splits data into fixed-size blocks, each with a unique address. Blocks are managed independently and assembled by the operating system into a usable volume, similar to a traditional hard drive. | Databases, virtual machine disks, and applications requiring low-latency, high-performance read/write access. | AWS EBS (Elastic Block Store) |
| **File Storage** | Organizes data in a hierarchical structure of files and folders, accessed through a shared file system over a network. Multiple systems can read/write to the same files concurrently. | Shared file systems, content repositories, home directories, and applications needing simultaneous multi-user access. | AWS EFS (Elastic File System) |
| **Object Storage** | Stores data as discrete objects (file + metadata + unique identifier) in a flat namespace rather than a folder hierarchy. Each object is accessed via a unique key/URL rather than a file path. | Storing massive amounts of unstructured data — images, videos, backups, static website assets. | AWS S3 (Simple Storage Service) |

## Why Object Storage Is Best for User-Uploaded Images

Object storage is the best choice for storing the client's user-uploaded images because it scales virtually without limit and doesn't require managing a rigid folder hierarchy — each image is simply stored as an object with a unique key, making retrieval fast and simple even across millions of files. It's also significantly more cost-effective for this kind of unstructured, rarely-modified data than block storage, while offering built-in durability, redundancy, and easy access over HTTP, which is exactly what a photo-sharing application needs to serve images reliably at scale.
