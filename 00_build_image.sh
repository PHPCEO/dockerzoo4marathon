#!/bin/bash
#25.01.2016
#Ioannis Petrousov
#petrousov@gmail.com
#This will build zookeeper image.


#check if the centos from docker hub is present
centos_presense=`docker images | grep docker.io/centos | cut -f 1 -d ' '`
if [ -z $centos_presense ]
then
	echo "Centos base image not found"
	echo "Downloading the image from docker hub by running:"
	docker pull centos
fi

echo 'Building zookeeper'
docker build -f files/Dockerfile --rm=true -t centos-zookeeper .
