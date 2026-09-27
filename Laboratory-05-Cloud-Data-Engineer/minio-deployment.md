# MinIO Deployment Documentation

## Docker Command Used

```bash
docker run -d -p 9000:9000 -p 9001:9001 --name minio-server \
-e "MINIO_ROOT_USER=c=admin" \
-e "MINIO_ROOT_PASSWORD=admin123" \
tobi312/minio:latest server --console-address ":9001" /data
```

> Note: The `tobi312/minio` mirror image was used instead of the official `minio/minio` image due to pull reliability on the KillerCoda playground. Functionality is identical.

## Web Console Access

- **Port used:** `9001`
- **Access method:** KillerCoda "Traffic / Ports" tab → entered port 9001 → Access
- **URL format:** `https://<session-id>-9001.papa.r.killercoda.com`

## Bucket Created

- **Name:** `client-photos`
- **Access policy:** Private
- **Test object uploaded:** `minio-deployed.png`

## Environment Variables Explained

| Flag | Purpose |
|---|---|
| `-e "MINIO_ROOT_USER=c=admin"` | Sets the root/admin username used to authenticate to both the MinIO API and the web console. |
| `-e "MINIO_ROOT_PASSWORD=admin123"` | Sets the root/admin password paired with the above username. Required for MinIO to start — without it, MinIO generates random credentials at runtime. |

These environment variables are injected into the container at startup and configure MinIO's built-in identity before the server process launches, avoiding the need to hardcode credentials into an image or config file.

## Screenshots
## MinIO Server Running
<img width="1343" height="601" alt="minio-deployed" src="https://github.com/user-attachments/assets/571c4c08-858c-4942-8486-16b55a72c711" />
— terminal output showing successful deployment and running container
##Bucket Created and File Uploaded
<img width="1917" height="1078" alt="minio-bucket-upload" src="https://github.com/user-attachments/assets/526dec1e-f464-4c7c-9efe-fb1fd8f0cae8" />
MinIO console showing the `client-photos` bucket with uploaded file
