#!/bin/bash

phoronix-test-suite batch-run pts/idle &
sleep 20s
./data.sh 
wait


