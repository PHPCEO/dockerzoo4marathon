# About
Standalone Zookeeper container to deploy on Mesos cluster with Marathon and route with HAProxy.
On container deployment, a bootstrap script is executed and wraps the zookeeper server script.
Base operating system is Centos.

# Usage
1. Build the image

        00_build_image.sh

2. Deploy on cluster

        01_deploy_to_marathon.sh

# Scaling
The image can be scaled as many times you like. Each time you scale, the new zookeeper instance gets a new broker.id which is a combination of the last IP
octet of the host and the random port it gets assigned.

# Scripts
I have included several scripts which help deployment and management of the image using the Marathon API.
