#!/bin/bash

phoronix-test-suite batch-run pts/jpegxl &
sleep 20s
./data_dram.sh
./data_dram.sh
#./data_dram.sh
wait


