#!/bin/bash

for i in {1..25};
do
  ./benign_app_core.sh
  sleep 5s
  sudo killall phoronix-test-suit
done

sleep 10s

for i in {1..25};
do
  ./benign_app_dram.sh
  sleep 5s
  sudo killall phoronix-test-suit
done
