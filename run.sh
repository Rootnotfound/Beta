#!/bin/bash

ImageName="webapp"
hostIP=8080

#Defaults:username !requiretty

sudo docker -d &
sleep 5
cd /
sudo docker build -t=$ImageName --no-cache vagrant
#sudo docker build -t="ImageName" docker-sample
sudo docker run -p=\"$hostIP:80\" $ImageName 
