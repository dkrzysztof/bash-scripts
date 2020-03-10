#!/bin/bash

while read -r line
do
	touch "${1}/${line}"
	echo ">created: ${1}/"$line
done < $2
