#!/bin/bash
appdir=$(realpath $(dirname "$0")/../)

composer install --ignore-platform-reqs --optimize-autoloader --working-dir="$appdir"
if (( $? != 0 ))
then
    echo "Error while installing application dependencies"
    exit 1
fi

server_registred=$(docker ps -a | grep "mafutha_app" | wc -l)
if (( $server_registred == 0 ))
then
    docker run --name mafutha_app -p 80:80 -v "$appdir:/app" -d php:7.1-cli php -S 0.0.0.0:80 -t /app/web
    if (( $? != 0 ))
    then
        echo "Error while starting web server"
        exit 1
    fi
else
    docker start mafutha_app
    if (( $? != 0 ))
    then
        echo "Error while starting web server"
        exit 1
    fi
fi
