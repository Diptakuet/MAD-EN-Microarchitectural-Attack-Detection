#!/bin/bash

for i in {1..20};
do
  ./benign_app_core_libraw.sh
  sleep 5s
  sudo killall phoronix-test-suit
done

sleep 10s

for i in {1..20};
do
  ./benign_app_core_gnupg.sh
  sleep 5s
  sudo killall phoronix-test-suit
done
