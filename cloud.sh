#!/bin/sh

containerName="myapp"
hostIP=1234
ImageName="webapp"

ssh -t 127.0.0.1 "sudo command"

sudo docker -d &
sleep 5

echo "Killing previous docker container"

sudo docker kill $containerName
sudo docker rm $containerName

#if [ -f /var/run/docker.pid ]; then
#sudo rm /var/run/docker.pid
#fi

echo "Starting new docker container"
cd ..
sudo docker build -t=$ImageName ninja_publish
sudo docker run -d --name $containerName -p=\"$hostIP:80\" $ImageName 
