#!/bin/bash

phoronix-test-suite batch-run pts/sqlite &
sleep 20s
./data.sh
wait


