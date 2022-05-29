#!/bin/bash

phoronix-test-suite batch-run pts/botan &
sleep 20s
./data.sh &
wait


