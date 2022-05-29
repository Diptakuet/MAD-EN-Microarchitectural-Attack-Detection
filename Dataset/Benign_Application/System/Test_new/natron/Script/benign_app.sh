#!/bin/bash

phoronix-test-suite batch-run pts/natron &
sleep 5s
./data.sh 
./data.sh
./data.sh
wait


