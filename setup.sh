#!/bin/bash

echo "Starting Dragon Ultra Panel setup..."

# Update package lists
sudo apt update

# Install nginx web server
sudo apt install -y nginx

# Copy panel files to nginx web root
sudo cp -r ./ /var/www/html/dragon-ultra-panel/

# Set ownership to www-data user
sudo chown -R www-data:www-data /var/www/html/dragon-ultra-panel/

# Restart nginx to apply changes
sudo systemctl restart nginx

# Allow HTTP (port 80) and HTTPS (port 443) through firewall
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

echo "Setup complete! Visit your panel at:"
echo "http://your-server-ip/dragon-ultra-panel/login.html"
echo "Or if you setup SSL, use https://your-domain.com/dragon-ultra-panel/login.html"
