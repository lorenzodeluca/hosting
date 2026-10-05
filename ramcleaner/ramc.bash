#!/bin/bash
while true;
do
 sync; 
 echo 1 > /proc/sys/vm/drop_caches;
 echo 2 > /proc/sys/vm/drop_caches;
 echo 3 > /proc/sys/vm/drop_caches;
 timedatectl;
 sleep 5m;
done