#!/bin/bash

phoronix-test-suite batch-run pts/himeno &
sleep 20s
./data.sh 
wait


