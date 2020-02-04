# Docker basic authorization proxy

This dockerfile build nginx for redirect http to https and bypass https to https by scheme.

## Build

1. Run the following command.
```bash
$ docker build -t nginx-http-redirect .
```

## Run

**Assumption**  
[https off-load server] <---X-forward-proto http,https---> [http-redirect server:8081] <------> [backend server:80]
The http-redirect server bypass traffic that X-forward-proto=https but it redirest traffic that X-forward-proto=http with nginx rewirte command to HTTPS-URL.
```bash
$ docker run -d -p 8081:81 \
             -e PROXY_PORT=81 \
             -e BACKEND_HOST=192.168.1.2 \
             -e BECKEND_PORT=80
             nginx-http-redirect
```
