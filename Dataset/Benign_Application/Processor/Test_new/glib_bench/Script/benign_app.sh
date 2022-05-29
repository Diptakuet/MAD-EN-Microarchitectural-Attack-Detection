#!/bin/bash

phoronix-test-suite batch-run pts/glibc-bench &
sleep 5s
./data.sh &
#./data.sh 
wait


