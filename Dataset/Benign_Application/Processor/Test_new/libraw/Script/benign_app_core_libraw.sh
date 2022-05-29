#!/bin/bash

phoronix-test-suite batch-run pts/libraw &
sleep 20s
./data_core_libraw.sh
#./data_core_libraw.sh
#./data_dram.sh
wait


