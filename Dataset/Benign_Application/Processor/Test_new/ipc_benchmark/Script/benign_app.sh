#!/bin/bash

phoronix-test-suite batch-run pts/ipc-benchmark &
sleep 20s
./data.sh &
wait


