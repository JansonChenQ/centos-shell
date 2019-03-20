#!/usr/bin/env bash
#安装所需要的包：
yum install -y yum-utils device-mapper-persistent-data lvm2
#设置稳定存储库：
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#开始安装DOCKER CE：
yum install docker-ce
#启动dockers：
systemctl start docker
#测试安装是否正确：
docker run hello-world
docker pull scrapinghub/splash
docker run -d -p 8050:8050 --memory=1.5G --restart=always --name splash scrapinghub/splash --maxrss 1200