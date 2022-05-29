#!/bin/bash

phoronix-test-suite batch-run pts/intel-mpi &
sleep 5s
./data.sh 
wait


