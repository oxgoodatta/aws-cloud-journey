#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install apache2 -y
echo 'Webserver 1 or 2 (set manually)' | sudo tee /var/www/html/index.html
sudo systemctl start apache2
sudo systemctl enable apache2
