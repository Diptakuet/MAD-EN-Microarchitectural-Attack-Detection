#!/bin/bash

phoronix-test-suite batch-run pts/git &
sleep 20s
./data.sh
./data.sh
wait


