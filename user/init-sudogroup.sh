#!/bin/bash
#
# 初始化sudo用户组bigdata

# 解决相对路径问题
cd `dirname $0`

# 检查是否为root用户，脚本必须在root权限下运行
source ../common/util.sh
util::check_root

# 设置sudogroup用户组
echo "设置sudo用户组为bigdata"
if [[ `grep -c "^bigdata" /etc/passwd` = 0 || `grep -c "^bigdata" /etc/group` = 0 ]]; then
#    useradd sudogroup
#    groupadd bigdata
    # 设置sudo权限
    echo "%bigdata    ALL=(ALL)       ALL" >> /etc/sudoers
else
    echo "bigdata用户已存在"
fi
