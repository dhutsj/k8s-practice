#! /bin/bash

echo "test"
for i in $(seq 1 100) 
do
     curl 10.105.65.45:80 >> /root/curl.log
done
