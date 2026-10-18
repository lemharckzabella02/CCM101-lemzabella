# Mission Reflection

## 1. Why check the host server's resources even if containers run perfectly?
Even if containers are running perfectly, it is important to check the host server's resources because all containers share the host's CPU, RAM, and disk space. If the host runs out of resources, containers may become slow, crash, or stop working. Monitoring the host helps ensure that applications remain stable and available.

## 2. How would `docker logs` help if a user cannot log into a web application?
The `docker logs` command helps troubleshoot login problems by showing the application's output and error messages. I would look for HTTP status codes such as 401 (unauthorized), 403 (forbidden), and 500 (internal server error). I would also check timestamps and error messages to identify when the problem occurred and what might have caused it.

## 3. Difference between monitoring logs (Checkpoint 4) and metrics (Checkpoint 5)?
Logs provide details about specific events, while metrics provide numerical measurements of system performance over time. For example, a 404 line in the logs indicates that a requested page was not found. In contrast, metrics such as 2.719 MiB of memory usage and 0.00% CPU usage show how much of the system's resources a container is using. Both logs and metrics are useful for troubleshooting and monitoring applications.

## 4. How do large companies monitor thousands of containers at once?
Large companies use monitoring tools such as Prometheus and Grafana to monitor thousands of containers. Prometheus collects and stores metrics, while Grafana displays the data in dashboards that make it easier to understand system performance. Companies also configure alerts to notify administrators when resource usage is too high, containers stop working, or other problems occur. These tools help teams identify and fix problems quickly.

## 5. How has your ability to troubleshoot Linux environments improved?
Through this lab, I have improved my ability to troubleshoot Linux environments by learning how to check container status, inspect logs, and monitor CPU and memory usage. I now understand that troubleshooting involves checking both the containers and the host server. I have also learned how to use Docker commands to identify errors and investigate possible causes instead of guessing what the problem was. This experience has helped me become more confident in diagnosing and resolving basic system issues.
