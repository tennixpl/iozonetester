#!/bin/bash
echo "test"

#ls /iozone/iozone3_465/src/current/
if [ -z "$VOLUMES" ]; then
    echo "no volumes"
else
    IFS=',' read -r -a array <<< "$VOLUMES"
    temp=1
    for i in "${array[@]}"
    do
      echo $i
      mkdir -p $i
      #/iozone/iozone3_465/src/current/iozone -i 0 -i 1 -i 2 -s 1m -s 8m -s 100m -s 1g -r 512k -r 824k -r 1m > $i/test.txt
      
      touch $i/test.txt
      pwd
    done
fi
ls /target/
touch /target/test.txt
for args in "$@"
do
    echo "$args + plus some crap"
done
# bash ./iozone
