#!/bin/bash
ImageName="webapp"
hostIP=8080
containerName="myapp"


if [ $# != 1 ]; then
	echo "Usage: ./run.sh [OPTIONS]"
	echo ""
	echo "Options:"
	echo "	-r  		build and run the docker container"
	echo "	-r  		stop and remove the docker container"
	exit
else
	if [ $1 == "-r" ]; then	
		echo "build and start the docker container"
		sudo docker -d &
		sleep 5
		cd /
		#sudo docker build -t=$ImageName --no-cache vagrant
		sudo docker build -t=$ImageName vagrant
		sudo docker run -d --name $containerName -p=\"$hostIP:80\" $ImageName 
		cd /vagrant
else
	if [ $1 == "-s" ]; then
		echo "stop and romve the docker container"
		sudo docker kill $containerName
		sudo docker rm $containerName

		if [ -f /var/run/docker.pid ]; then
		sudo rm /var/run/docker.pid
		fi
else 
	echo "Usage: ./run.sh [OPTIONS]"
	echo "\n\n"
	echo "Options:\n"
	echo "	-r  		build and run the docker container\n"
	echo "	-r  		stop and remove the docker container\n"
	exit
fi
fi
fi
fi