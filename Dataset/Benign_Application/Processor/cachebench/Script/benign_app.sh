#!/bin/bash

phoronix-test-suite batch-run pts/cachebench &
sleep 20s
./data.sh
sleep 5s 
./data.sh
sleep 5s
./data.sh
wait


