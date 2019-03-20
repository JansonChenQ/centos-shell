#!/bin/bash
#
# 业务系统文件夹初始化，较少的文件夹，以业务为主
# 此文件夹隶属于big-data这个用户，注意这个用户有sudo权限

# 解决相对路径问题
cd `dirname $0`

# 检查是否为root用户，脚本必须在root权限下运行
source ../common/util.sh
util::check_root

# 工具
mkdir -p /data/
mkdir -p /data/service
mkdir -p /data/service/common_conf
mkdir -p /data/service/java
mkdir -p /data/service/maven
mkdir -p /data/service/nginx
mkdir -p /data/service/nginx_base
mkdir -p /data/service/nginx_vhost
mkdir -p /data/service/node
mkdir -p /data/service/rsync
mkdir -p /data/service/tomcat
mkdir -p /data/service/tomcat_base

# 应用
mkdir -p /data/webapp
mkdir -p /data/webapp/www.domain.com

# 日志
mkdir -p /data/weblog
mkdir -p /data/weblog/business
mkdir -p /data/weblog/business/www.domain.com
mkdir -p /data/weblog/nginx
mkdir -p /data/weblog/nginx/default
mkdir -p /data/weblog/nginx/www.domain.com
mkdir -p /data/weblog/tomcat
mkdir -p /data/weblog/tomcat/www.domain.com

# 初始化用户
if [[ `grep -c "^big-data" /etc/passwd` = 0 || `grep -c "^big-data" /etc/group` = 0 ]]; then
    useradd big-data
    # 增加sudo权限
    echo "%big-data    ALL=(ALL)       ALL" >> /etc/sudoers
    # 设置密码
    echo "big-data用户新建完成，请设置big-data用户密码"
    # passwd big-data
else
    echo "big-data用户已存在"
fi

# 设置文件夹用户组权限
chown big-data:big-data /data
# java
chown -R big-data:big-data /data/service
chown -R big-data:big-data /data/service/common_conf
chown -R big-data:big-data /data/service/java
chown -R big-data:big-data /data/service/maven
chown -R big-data:big-data /data/service/nginx
chown -R big-data:big-data /data/service/nginx_base
chown -R big-data:big-data /data/service/nginx_vhost
chown -R big-data:big-data /data/service/node
chown -R big-data:big-data /data/service/rsync
chown -R big-data:big-data /data/service/tomcat
chown -R big-data:big-data /data/service/tomcat_base
# 应用
chown -R big-data:big-data /data/webapp
chown -R big-data:big-data /data/webapp/www.domain.com
# 日志
chown -R big-data:big-data /data/weblog
chown -R big-data:big-data /data/weblog/business
chown -R big-data:big-data /data/weblog/business/www.domain.com
chown -R big-data:big-data /data/weblog/nginx
chown -R big-data:big-data /data/weblog/nginx/default
chown -R big-data:big-data /data/weblog/nginx/www.domain.com
chown -R big-data:big-data /data/weblog/tomcat
chown -R big-data:big-data /data/weblog/tomcat/www.domain.com
# 增删改权限
chmod 775 /data
# java
chmod -R 775 /data/service
chmod -R 775 /data/service/common_conf
chmod -R 775 /data/service/java
chmod -R 775 /data/service/maven
chmod -R 775 /data/service/nginx
chmod -R 775 /data/service/nginx_base
chmod -R 775 /data/service/nginx_vhost
chmod -R 775 /data/service/node
chmod -R 775 /data/service/rsync
chmod -R 775 /data/service/tomcat
chmod -R 775 /data/service/tomcat_base
# 应用
chmod -R 775 /data/webapp
chmod -R 775 /data/webapp/www.domain.com
# 日志
chmod -R 775 /data/weblog
chmod -R 775 /data/weblog/business
chmod -R 775 /data/weblog/business/www.domain.com
chmod -R 775 /data/weblog/nginx
chmod -R 775 /data/weblog/nginx/default
chmod -R 775 /data/weblog/nginx/www.domain.com
chmod -R 775 /data/weblog/tomcat
chmod -R 775 /data/weblog/tomcat/www.domain.com