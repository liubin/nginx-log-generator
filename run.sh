#!/bin/sh

mkdir -p /var/log/nginx
touch /var/log/nginx/access.log
ruby app.rb &

tail -f /var/log/nginx/access.log
