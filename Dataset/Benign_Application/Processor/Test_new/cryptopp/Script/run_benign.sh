#!/bin/bash

for i in {1..5};
do
  ./benign_app.sh
  sudo killall phoronix-test-suit
done

