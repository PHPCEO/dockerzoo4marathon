#!/bin/sh

#Ioannis Petrousov
#petrousov@gmail.com

# Get Host IP
IFS=. read ip1 ip2 ip3 ip4 <<< "$HOST"
#echo "ip1=${ip1}"
#echo "ip2=${ip2}"
#echo "ip3=${ip3}"
#echo "ip4=${ip4}"

#Create unique broker.id as combination of last octet and the given Marathon Docker port
broker_id="${ip4}${PORT0}"
echo "Broker ID="$broker_id

mkdir /tmp/zookeeper
echo $broker_id > /tmp/zookeeper/myid
echo "ZKID=`cat /tmp/zookeeper/myid`" #this will show in the sandbox

# https://zookeeper.apache.org/doc/trunk/zookeeperStarted.html
cat > /opt/zookeeper/conf/zoo.cfg <<EOF
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/tmp/zookeeper
clientPort=2181
EOF

#start zookeeper server
bash /opt/zookeeper/bin/zkServer.sh start-foreground
