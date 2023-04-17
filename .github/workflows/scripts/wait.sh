#!/bin/sh

while true
do
	sleep 1
	[ -f "/tmp/done" ] && exit 0
	[ -f "/tmp/error" ] && echo "::error::$(cat /tmp/error)" && exit 1
done
