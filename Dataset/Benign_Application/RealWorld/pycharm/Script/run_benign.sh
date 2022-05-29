#!/bin/bash

# sh opt/pycharm-*/bin/pycharm.sh

for i in {1..50};
do
  ./data_core.sh
done

sleep 5s

for i in {1..50};
do
  ./data_dram.sh
done
