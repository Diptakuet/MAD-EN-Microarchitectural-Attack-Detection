#!/bin/bash

phoronix-test-suite batch-run pts/sysbench &
sleep 20s
./data.sh 
wait


