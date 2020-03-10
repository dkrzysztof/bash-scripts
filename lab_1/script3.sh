#!/bin/bash

for file in $1/*.*
do
        if [ ! -x $file ]
        then
                echo $file #usuwanie
        fi
done

