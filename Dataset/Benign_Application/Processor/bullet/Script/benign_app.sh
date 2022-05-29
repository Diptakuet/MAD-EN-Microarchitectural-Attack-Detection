#!/bin/bash

phoronix-test-suite batch-run pts/bullet &
sleep 5s
./data.sh
#./data.sh
wait


