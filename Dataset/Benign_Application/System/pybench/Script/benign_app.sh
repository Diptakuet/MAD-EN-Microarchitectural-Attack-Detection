#!/bin/bash

phoronix-test-suite batch-run pts/pybench &
sleep 17s
./data.sh
#./data.sh
wait


