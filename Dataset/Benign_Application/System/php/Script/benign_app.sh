#!/bin/bash

phoronix-test-suite batch-run pts/php &
sleep 18s
./data.sh
#./data.sh
wait


