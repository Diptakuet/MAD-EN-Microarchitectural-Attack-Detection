#!/bin/bash

for i in {1..50};
do
  ./benign_app_core.sh
  sleep 5s
done

sleep 5s

for i in {1..50};
do
  ./benign_app_dram.sh
  sleep 5s
done
