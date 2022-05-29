#!/bin/bash

phoronix-test-suite batch-run pts/blake2 &
sleep 5s
./data.sh 
wait


