#!/bin/bash

for i in {1..1};
do
  ./benign_app.sh
  sleep 5s
  sudo killall phoronix-test-suit
done


