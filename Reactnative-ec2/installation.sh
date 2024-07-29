#! /bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt-get install ruby-full -y
sudo apt-get install wget -y
cd /home/ubuntu
sudo wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
service codedeploy-agent start
