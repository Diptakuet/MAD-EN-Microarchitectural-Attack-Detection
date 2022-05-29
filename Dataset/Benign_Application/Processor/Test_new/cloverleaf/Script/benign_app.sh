#!/bin/bash

phoronix-test-suite batch-run pts/cloverleaf &
sleep 25s
./data.sh 
wait


