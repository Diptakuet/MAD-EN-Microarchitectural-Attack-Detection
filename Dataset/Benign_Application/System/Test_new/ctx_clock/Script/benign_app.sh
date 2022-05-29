#!/bin/bash

phoronix-test-suite batch-run pts/ctx-clock &
sleep 5s
./data.sh 
wait


