#! /bin/sh

if [[ $EUID -ne 0 ]]; then
    echo "Error:This script must be run as root!" 1>&2
    exit 1
fi

if [ -f  jdk-8u152-linux-x64.tar.gz ]; then
    echo "use local jdk image file"
else
    wget https://mirrors.huaweicloud.com/java/jdk/8u152-b16/jdk-8u152-linux-x64.tar.gz
fi

if [ -d jdk1.8.0_152 ]; then 
    rm -rf jdk1.8.0_152
fi

tar -zxvf jdk-8u152-linux-x64.tar.gz

if [ -d /usr/local/java ]; then 
    rm -rf /usr/local/java
fi

mkdir -p /usr/local/java
mv jdk1.8.0_152/ /usr/local/java/
chown -R root:root /usr/local/java/
echo 'setting setting environment variable'
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export JAVA_HOME=/usr/local/java/jdk1.8.0_152
export JRE_HOME=/usr/local/java/jdk1.8.0_152/jre
export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib"' >> /etc/environment

echo 'export JAVA_HOME=/usr/local/java/jdk1.8.0_152
export JRE_HOME=/usr/local/java/jdk1.8.0_152/jre
export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH:$HOME/bin' >> /etc/profile

export JAVA_HOME=/usr/local/java/jdk1.8.0_152
export JRE_HOME=/usr/local/java/jdk1.8.0_152/jre
export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH:$HOME/bin

echo "finish setting environment variable"