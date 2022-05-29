#!/bin/bash

phoronix-test-suite batch-run system/openscad &
sleep 20s
./data.sh 
./data.sh 
./data.sh 
./data.sh
wait


