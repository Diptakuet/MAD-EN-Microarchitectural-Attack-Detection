#!/bin/bash

phoronix-test-suite batch-run system/gnupg &
sleep 20s
./data_core_gnupg.sh
#./data_core_gnupg.sh
#./data_core.sh
wait


