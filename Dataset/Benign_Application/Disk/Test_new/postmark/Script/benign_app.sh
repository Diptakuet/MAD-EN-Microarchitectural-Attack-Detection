#!/bin/bash

phoronix-test-suite batch-run pts/postmark &
sleep 5s
./data.sh
wait


