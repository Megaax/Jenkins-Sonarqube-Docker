#!/bin/bash

# Update package lists
sudo apt update -y

# Download SonarQube zip file
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip

# Install unzip utility
sudo apt install unzip -y

# Unzip SonarQube zip file
unzip sonarqube-9.9.0.65466.zip

# Navigate to SonarQube directory
cd sonarqube-9.9.0.65466/bin/linux-x86-64/

#install jre openjdk
sudo apt install openjdk-17-jre -y

#launch SonarQube
./sonar.sh console

