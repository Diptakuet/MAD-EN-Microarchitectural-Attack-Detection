#!/bin/bash

phoronix-test-suite batch-run pts/blosc &
sleep 7s
./data.sh 
wait


