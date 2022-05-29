#!/bin/bash

phoronix-test-suite batch-run pts/cryptopp &
sleep 20s
./data.sh 
./data.sh 
wait


