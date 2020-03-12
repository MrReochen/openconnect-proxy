#!/bin/sh

run() {
	echo $PASSWORD | openconnect $URL --no-dtls --script-tun --script="ocproxy -g -D 1080" -u $USER --protocol=$PROTOCOL
}

until(run); do
	echo "openconnect exited. Restarting process in 60 seconds…" >&2
  	sleep 60
done