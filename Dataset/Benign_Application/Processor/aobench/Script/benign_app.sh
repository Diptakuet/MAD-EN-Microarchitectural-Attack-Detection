#!/bin/bash

phoronix-test-suite batch-run pts/aobench &
sleep 20s
./data.sh &
wait


