#!/bin/bash

######################Customize Settings######################

#warName: The name of the war file generated by Maven build
warName=ninja-sample-1.0-SNAPSHOT.war

#dockerImageName: The name to build the docker image. (Do not need to change)
dockerImageName="webapp"
#containerName: The name to run the docker container. (Do not need to change)
containerName="myapp"
#appFolderName: The folder of your application.
appFolderName=ninja-sample


######################Customize Settings######################
oldwarName=ninja-sample-1.0-SNAPSHOT.war
olddockerImageName="webapp"
oldcontainerName="myapp"
oldappFolderName=ninja-sample

#warPath=
#appFolderPath=

if [ ! -d "app/run/$appFolderName" ]; then
	if [ ! -d "~/$appFolderName" ]; then
		if [ -f $appFolderName/.git ]; then
			sudo rm $appFolderName/.git
		fi
		mkdir app
		mkdir app/run
		mv $appFolderName app/run && echo "The application has been copied successfully."
	fi
fi

if [ ! -d "app/run/$appFolderName" ]; then
		echo "Fail to copy the application."
fi

sed -i -e "s/target\/$oldwarName/target\/$warName/g" start-script/start-everything.sh
sed -i -e "s/\/usr\/local\/run\/$oldappFolderName/\/usr\/local\/run\/$appFolderName/g" start-script/start-everything.sh
rm start-script/start-everything.sh-e


sed -i -e "s/$olddockerImageName/$dockerImageName/g" run.sh
sed -i -e "s/$oldcontainerName/$containerName/g" run.sh
rm run.sh-e

sed -i -e "s/$oldappFolderName/$appFolderName/g" Dockerfile
rm Dockerfile-e

sed -i -e "s/oldwarName=$oldwarName/oldwarName=$warName/g" app_setup.sh
sed -i -e "s/olddockerImageName=$olddockerImageName/olddockerImageName=$dockerImageName/g" app_setup.sh
sed -i -e "s/oldcontainerName=$oldcontainerName/oldcontainerName=$containerName/g" app_setup.sh
sed -i -e "s/oldappFolderName=$oldappFolderName/oldappFolderName=$appFolderName/g" app_setup.sh
rm app_setup.sh-e
