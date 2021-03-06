#!/bin/bash
#
# 此文件夹隶属于bigdata这个用户，注意这个用户有sudo权限

# 解决相对路径问题
cd `dirname $0`

# 检查是否为root用户，脚本必须在root权限下运行
source ../common/util.sh
util::check_root

# 复制文件夹
cp -rf data /

# 复制文件夹说明
cp README.md /data

# 清除.gitignore文件
find /data -exec mv {}/.gitignore /tmp 1>/dev/null 2>&1 \;

# 初始化用户
if [[ `grep -c "^bigdata" /etc/passwd` = 0 || `grep -c "^bigdata" /etc/group` = 0 ]]; then
    useradd bigdata
    # 增加sudo权限
    echo "%bigdata    ALL=(ALL)       ALL" >> /etc/sudoers
    # 设置密码
    echo "设置bigdata用户密码"
    # passwd bigdata
else
    echo "bigdata用户已存在"
fi

# 设置文件夹用户组权限
chown bigdata:bigdata /data
chown -R bigdata:bigdata /data/service
chown -R bigdata:bigdata /data/webapp
chown -R bigdata:bigdata /data/weblog
# 增删改权限
chmod 775 /data
chmod -R 775 /data/service
chmod -R 775 /data/webapp
chmod -R 775 /data/weblog