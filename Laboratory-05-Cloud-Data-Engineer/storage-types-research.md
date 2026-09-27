# Types of Cloud Storage

| Storage Type    | Description                                                                 | Primary Use Case                                      | Cloud Provider Example |
|------------------|------------------------------------------------------------------------------|--------------------------------------------------------|--------------------------|
| **Block Storage** | Splits data into fixed-size blocks, each with a unique address. Blocks are managed directly by the OS, similar to a raw hard drive. | High-performance workloads like databases and virtual machine disks. | AWS EBS                 |
| **File Storage**  | Organizes data in a hierarchical folder/file structure accessed over a network (like a shared drive). | Shared file access across multiple servers/users, e.g., content management systems. | AWS EFS                 |
| **Object Storage** | Stores data as discrete objects (data + metadata + unique ID) in a flat address space, accessed via HTTP/API calls. | Massive amounts of unstructured data — images, videos, backups. | AWS S3 / MinIO           |

## Why Object Storage is Best for Client Photos

Object Storage is the ideal choice for the client's photo-sharing app because it can scale virtually infinitely to hold millions of images without the file-count or capacity limits that block or file storage systems run into. Each photo is stored as an independent object accessible over HTTP, making it simple to retrieve directly from a web or mobile app. Additionally, rich metadata (like upload date, user ID, or tags) can be attached to each object, making the images easier to organize and search as the platform grows.
