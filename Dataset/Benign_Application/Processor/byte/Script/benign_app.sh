#!/bin/bash

phoronix-test-suite batch-run pts/byte-1.2.2 &
sleep 20s
./data.sh &
wait


