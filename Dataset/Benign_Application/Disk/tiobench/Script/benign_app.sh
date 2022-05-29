#!/bin/bash


phoronix-test-suite batch-run pts/tiobench &
sleep 10s
./data.sh 
#sleep 5s
./data.sh
wait


