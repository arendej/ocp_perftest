#!/bin/sh

# Start service in background here
phoronix-test-suite start-phoromatic-server
phoronix-test-suite phoromatic.connect ocpperftest-ocpperftest.customer.com:80/6CU5VN

#while [ 1 ]
#do
#	sleep 5
#done

#echo "[hit enter key to exit] or run 'docker stop <container>'"
#read


# stop service and clean up here
#echo "stopping phoronix-test-suite"
#phoronix-test-suite stop-remote-gui-server

echo "exited $0"
