#!/bin/bash


if [ $# -eq 1 ] | [ -d $1/ ]
then
	del_file="${1}/deleted.txt"
	touch $del_file
	echo "List of deleted files:" > $del_file

	for file in $1/*.*
	do
		if [ ! -s $file ]
		then
			if [ ${file: -11} != "deleted.txt" ] | [ -L $file ]
			then
				echo $file >> $del_file
				echo $file
				rm $file
			fi
		fi
	done
else
	echo "Nalezy podac katalog badz podano za duzo argumentow"
fi
