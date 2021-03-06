#!/bin/bash
#
# java 1.8.0_172

# 解决相对路径问题
cd `dirname $0`

# 定义全局变量
JAVA_URL=https://github.com/frekele/oracle-java/releases/download/8u172-b11/jdk-8u172-linux-x64.tar.gz
JAVA_FILE=jdk-8u172-linux-x64.tar.gz
JAVA_FILE_PATH=jdk1.8.0_172
JDK_PATH=/usr/etc/java
JAVA_PROFILE_D=/etc/profile.d/java.sh

if [[ "$(whoami)" != "root" ]]; then
        echo "please run this script as root !" >&2
        exit 1
fi

if [[ ! -f ${JAVA_FILE} ]]; then
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $JAVA_URL -O $JAVA_FILE && tar zxvf $JAVA_FILE
fi
# 下载并解压

if [[ ! -d ${JDK_PATH} ]]; then
mkdir ${JDK_PATH}
fi

# 移动
mv $JAVA_FILE_PATH/* $JDK_PATH

# 设置环境变量
cat <<EOF > $JAVA_PROFILE_D
export JAVA_HOME=$JDK_PATH
export JRE_HOME=$JDK_PATH/jre
export CLASSPATH=.:\$JAVA_HOME/lib:\$JRE_HOME/lib:\$CLASSPATH
export PATH=\$JAVA_HOME/bin:\$PATH
EOF

# 更新环境变量
source /etc/profile

# 使其与yum安装的保持一致
mkdir -p /usr/lib/jvm/java-1.8.0/bin/
ln -s $JDK_PATH/bin/java /usr/lib/jvm/java-1.8.0/bin/java
mkdir -p /usr/lib/jvm/jre-1.8.0/bin/
ln -s $JDK_PATH/jre/bin/java /usr/lib/jvm/jre-1.8.0/bin/java
ln -s $JDK_PATH/bin/java /usr/bin/java