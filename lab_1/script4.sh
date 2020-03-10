#!/bin/bash

counter=1
for file in `ls -S $1`
do
	if [ -x $file ]
	then
		echo "${file}.${counter}" # mv $file "${file}.${counter}"
		counter=$((counter+1))
	fi
done

