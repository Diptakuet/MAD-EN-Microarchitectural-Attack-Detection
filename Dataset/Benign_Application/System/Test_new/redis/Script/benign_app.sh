#!/bin/bash

phoronix-test-suite batch-run pts/redis &
sleep 20s
./data.sh 
wait


