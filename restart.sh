#!/bin/bash

kubectl get pods -n=gitlab > output.txt

cat output.txt | while read line
do
   # do something with $line here
   echo $line
   if [[ $line == *"dsrc-processing"* ]]; then
     for word in $line; do 
       echo kubectl delete pod "$word" -n=gitlab
       kubectl delete pod "$word" -n=gitlab
       break
     done
   fi
done
