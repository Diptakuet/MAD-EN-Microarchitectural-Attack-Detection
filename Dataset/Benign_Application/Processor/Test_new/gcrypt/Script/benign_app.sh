#!/bin/bash

phoronix-test-suite batch-run pts/gcrypt &
sleep 20s
./data.sh 
./data.sh 
./data.sh 
wait


