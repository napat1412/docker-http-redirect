# Docker http redirect

This dockerfile build nginx for redirect http to https and bypass https to https that depend on X-forwarded-proto.

## Build

1. Run the following command.
```bash
$ docker build -t nginx-http-redirect .
```

## Run

**Assumption**  
[https off-load server] <---X-forwarded-proto http,https---> [http-redirect server:8081] <------> [backend server:80]
The http-redirect server bypass traffic that X-forwarded-proto=https but it redirect traffic that X-forwarded-proto=http with http_code 301 to HTTPS location.
```bash
$ docker run -d -p 8081:81 \
             -e PROXY_PORT=81 \
             -e BACKEND_HOST=192.168.1.2 \
             -e BACKEND_PORT=80 \
             nginx-http-redirect
```
