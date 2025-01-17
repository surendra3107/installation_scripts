#!/bin/bash

sudo apt update
sudo apt install openjdk-11-jre -y
java -version

sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update
sudo apt install jenkins -y

sudo systemctl start jenkins.service


sudo ufw allow 8080

sudo ufw allow OpenSSH
sudo ufw enable

sudo ufw status

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

sudo systemctl status jenkins
