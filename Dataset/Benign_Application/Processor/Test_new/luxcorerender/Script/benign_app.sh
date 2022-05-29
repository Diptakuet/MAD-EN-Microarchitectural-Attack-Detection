#!/bin/bash

phoronix-test-suite batch-run pts/luxcorerender &
sleep 20s 
./data.sh 
wait


