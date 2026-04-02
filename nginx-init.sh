#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Install gettext-utils, which provides the 'envsubst' command
apk add --no-cache gettext

echo "Starting Nginx's nginx-init script..."
# Use envsubst to substitute the port into the template and create the final
# config file for Nginx to use.
envsubst '$PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

echo "Nginx config generated:"
cat /etc/nginx/conf.d/default.conf
echo "------------------------"

# Start the Nginx server in the foreground.
echo "Starting Nginx..."
nginx -g 'daemon off;'