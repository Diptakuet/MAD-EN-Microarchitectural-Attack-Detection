#!/bin/bash

phoronix-test-suite batch-run pts/n-queens &
sleep 20s
./data_core_nqueens.sh
#./data_core_nqueens.sh
#./data_core.sh
wait


