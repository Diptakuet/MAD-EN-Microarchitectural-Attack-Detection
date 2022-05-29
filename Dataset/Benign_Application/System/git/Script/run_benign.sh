#!/bin/bash

for i in {1..25};
do
  ./benign_app.sh
  sleep 10s
  sudo killall phoronix-test-suit
done
