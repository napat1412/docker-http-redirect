#!/bin/bash

# Verify & Initial Environment Variable
if [ ! -v BACKEND_HOST ]; then
  echo '$BACKEND_HOST must not empty'
  exit 1; 
fi
if [ ! -v PROXY_PORT ]; then PROXY_PORT=80; fi
if [ ! -v BACKEND_PORT ]; then BACKEND_PORT=80; fi

echo "Proxy run at port: $PROXY_PORT";
echo "Backend run at $BACKEND_HOST:$BACKEND_PORT";

sed -i -e "s/PROXY_PORT/${PROXY_PORT}/" /etc/nginx/conf.d/default.conf
sed -i -e "s/BACKEND_HOST/${BACKEND_HOST}/" /etc/nginx/conf.d/default.conf
sed -i -e "s/BACKEND_PORT/${BACKEND_PORT}/" /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
