#!/bin/bash

phoronix-test-suite batch-run system/iozone &
sleep 20s
./data.sh
wait


