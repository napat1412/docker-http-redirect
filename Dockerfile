FROM nginx:1.16

# Setup configurations
#ADD nginx/ /etc/nginx/
ADD nginx/conf.d /etc/nginx/conf.d
ADD entrypoint.sh /opt/bin/entrypoint.sh

ENTRYPOINT ["/opt/bin/entrypoint.sh"]
