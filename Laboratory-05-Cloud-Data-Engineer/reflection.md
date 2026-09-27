# Mission 5 Reflection

Object storage is far better suited than block storage for handling millions of user-uploaded photos because of how each system organizes data. Block storage divides data into fixed-size blocks that are typically tied to a single server or volume, which works well for structured, frequently-changing data like databases or operating system files, but doesn't scale efficiently for massive amounts of unstructured files. Object storage, on the other hand, stores each file as a whole object with rich metadata and a unique identifier, distributed across a flat, virtually limitless namespace. This makes it trivially scalable, since adding capacity doesn't require restructuring how data is addressed.

Docker made deploying MinIO significantly easier than a manual installation would have been. Instead of configuring dependencies, networking, and storage paths by hand, a single `docker run` command with environment variables spun up a fully functional S3-compatible server in seconds. The container isolated MinIO from the rest of the system, and mapping ports 9000 and 9001 gave me immediate access to both the API and the web console without extra setup.

A "bucket" in cloud storage is essentially a top-level container that holds objects. It functions similarly to a root folder, but unlike traditional folders, buckets have globally unique names (within a provider) and their own access policies, versioning settings, and lifecycle rules attached directly to them.

For data durability at enterprise scale, large companies typically replicate objects across multiple physical drives, servers, and often multiple geographic data centers. Techniques like erasure coding or full replication ensure that even if a server or entire data center fails, the data remains recoverable from other locations.

My confidence in the Linux command line keeps growing with each lab. Running Docker commands, verifying container status with `docker ps`, and troubleshooting issues (like the username formatting problem I ran into) all feel more intuitive now than they did in earlier labs, and I'm relying less on trial and error each time.
