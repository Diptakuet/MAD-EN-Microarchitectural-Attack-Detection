#!/bin/bash

phoronix-test-suite batch-run pts/minion &
sleep 20s
./data.sh 
./data.sh
wait


