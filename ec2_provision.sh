#!/bin/bash
apt-get update && apt-get upgrade -y
apt-get install -y openjdk-11-jdk
apt-get install -y python3 python3-pip
apt-get install -y vim
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install -y jenkins
apt-get install -y nginx
apt-get install -y tomcat9 tomcat9-admin
NIFI_VERSION=1.15.3
wget https://archive.apache.org/dist/nifi/${NIFI_VERSION}/nifi-${NIFI_VERSION}-bin.tar.gz
tar -xzf nifi-${NIFI_VERSION}-bin.tar.gz -C /opt/
ln -s /opt/nifi-${NIFI_VERSION} /opt/nifi
/opt/nifi/bin/nifi.sh start
apt-get install -y awscli
