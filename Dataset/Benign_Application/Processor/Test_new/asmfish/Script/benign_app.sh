#!/bin/bash

phoronix-test-suite batch-run pts/asmfish &
sleep 10s
./data.sh 
./data.sh
wait


