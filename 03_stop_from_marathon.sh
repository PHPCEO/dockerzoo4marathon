#!/bin/bash   

# MAINTAINER: Ioannis Petrousov
# EMAIL: petrousov@gmail.com
# DATE: 25/01/2016

# This script will delete an app running on marathon.

# The master may not be unique, so you need to set a list of masters or export some env vars.
read MASTER
APP="zookeeper.marathon"

if [ -z "$MASTER" ]; then
    echo "Need to set MASTER"
    exit 1
fi


CURL="curl -X DELETE $MASTER:8080/v2/apps/$APP | python -m json.tool"
echo $CURL
eval $CURL
