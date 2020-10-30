#!/bin/bash

function sync_ssh {
	local=$1
	remote=$2
	port=$3
	if [ -z "$port" ]; then
	    port="22"
	fi
	rsync -trvlH -e "ssh -p $port" --delete $1 $2
}

function upload {
	local=$1
	remote=$2
	        port=$3
        if [ -z "$port" ]; then
            port="22"
        fi
        rsync --archive --verbose --progress -e "ssh -p $port" --exclude '.git' --exclude '.idea' --exclude '__pycache__' --exclude 'venv' $1 $2
}
