#!/bin/bash

for i in {1..10};
do
  ./benign_app_core.sh
  sleep 5s
  sudo killall phoronix-test-suit
done
