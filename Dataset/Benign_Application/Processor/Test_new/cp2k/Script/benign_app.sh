#!/bin/bash

phoronix-test-suite batch-run pts/cp2k &
sleep 20s
./data.sh 
./data.sh 
./data.sh 
wait


