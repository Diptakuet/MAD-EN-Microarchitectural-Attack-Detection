#!/bin/bash

phoronix-test-suite batch-run pts/hackbench &
sleep 10s
./data.sh  
wait


