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
      /iozone/iozone3_465/src/current/iozone -a > $i/test.txt
      pwd
      python create_json $i/test.txt
    done
fi
ls /target/
touch /target/test.txt
for args in "$@"
do
    echo "$args + plus some crap"
done
# bash ./iozone
