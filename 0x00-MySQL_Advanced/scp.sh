#!/bin/bash

if [ ! "$1" ]
then
	echo "too short"
	exit 99
fi

sshpass -p a733144b1f81c669b222 scp "$1" \
	0beff6266b41@0beff6266b41.2aeed79a.alx-cod.online:/root
