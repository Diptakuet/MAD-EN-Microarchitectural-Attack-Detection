#!/bin/bash

phoronix-test-suite batch-run pts/encode-mp3 &
sleep 20s
./data.sh
wait


