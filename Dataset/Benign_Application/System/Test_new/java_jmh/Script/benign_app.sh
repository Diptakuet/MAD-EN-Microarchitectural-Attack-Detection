#!/bin/bash

phoronix-test-suite batch-run pts/java-jmh &
sleep 5s
./data.sh 
./data.sh
./data.sh 
./data.sh
./data.sh 
wait


