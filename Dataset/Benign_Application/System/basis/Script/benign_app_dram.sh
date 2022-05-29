#!/bin/bash

phoronix-test-suite batch-run pts/basis &
sleep 20s
./data_dram.sh
./data_dram.sh
#./data_dram.sh
wait


