#!/bin/bash

phoronix-test-suite batch-run pts/arrayfire &
sleep 5s
./data.sh
#./data.sh
wait


