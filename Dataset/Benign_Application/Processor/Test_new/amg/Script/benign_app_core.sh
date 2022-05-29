#!/bin/bash

phoronix-test-suite batch-run pts/amg &
sleep 5s
./data_core.sh
#./data_core.sh
#./data_core.sh
wait


