#!/bin/bash

phoronix-test-suite batch-run pts/basis &
sleep 20s
./data_core.sh
./data_core.sh
#./data_core.sh
wait


