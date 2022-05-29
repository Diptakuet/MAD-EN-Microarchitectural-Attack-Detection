#!/bin/bash

phoronix-test-suite batch-run pts/intel-mpi &
sleep 20s
./data.sh 
wait


