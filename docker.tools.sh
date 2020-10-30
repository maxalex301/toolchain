#!/bin/bash

function did {
    echo "$(docker ps -q -f name=$1 | head -1)"
}

function dname {
   echo "$(docker inspect --format='{{.Name}}' $1)"
}

function dkill {
   container_name="$(did $1)"
   docker stop $container_name && docker rm $container_name
}

function dlog {
   container_name="$(did $1)"
   shift
   docker logs $@ $container_name
}


function de {
    name=$1
    shift
    if [ -z "$@" ]; then
            params=bash
    else
            params=$@
    fi
    id="$(did $name)"
    echo "Exec command ${params} in container: ${id}"
    docker exec -it ${id} ${params}
}
