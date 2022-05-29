#!/bin/bash

phoronix-test-suite batch-run pts/hint &
sleep 5s
./data.sh 
wait


