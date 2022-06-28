#!/bin/bash

phoronix-test-suite batch-run pts/jpegxl &
sleep 20s
./data.sh
./data.sh
wait


