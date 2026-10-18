# Container Observability

## Application Log: 404 Error

```
172.17.0.1 - - [18/Oct/2026:01:45:49 +0000] "GET /hidden-admin-page HTTP/1.1" 404 153 "-" "curl/8.5.0" "-"
```

Application logs record every request along with its status code, so I can see exactly what happened and when a failure occurred. Without them I would be guessing about the cause of errors, which makes troubleshooting slow and unreliable.

## Real-Time Container Metrics (client-website)

| Metric | Value at time of screenshot |
|---|---|
| Memory Usage | 2.719MiB |
| CPU % | 0.00% |
