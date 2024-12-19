#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<html><body><h1>Examen ASO</h1></body></html>" | sudo tee /var/www/html/index.html
