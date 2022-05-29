#!/bin/bash

phoronix-test-suite batch-run pts/tnn &
sleep 20s
./data.sh 
./data.sh 
./data.sh 
./data.sh
wait


