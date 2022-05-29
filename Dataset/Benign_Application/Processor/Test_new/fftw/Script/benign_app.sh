#!/bin/bash

phoronix-test-suite batch-run pts/fftw &
sleep 20s
./data.sh 
wait


