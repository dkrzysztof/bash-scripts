#!/bin/bash
if [ -d $1 ] && [ "$#" -eq 1 ]
then
    # usuwanie zawartości w podanym katalogu
    rm -rf $1/*
    # tworzenie plików do teststowania zadania
    touch $1/obraz{1..3}.txt $1/obraz{1..3}.png $1/dokument{1..3}.dat $1/test{1..6}.jpg
    mkdir $1/test{1..2}
    touch $1/test1/obraz.dat $1/test2/obraz.png
    echo "List of files:" > result.dat

    find $1 -size +1k \( -name "*.txt" -o -name "*.dat" \) -type f | while read file
    do
        d=`date +%m.%d.%Y/%H:%M:%S| tr "/" "|" `
        str=`realpath $file`
        echo "$str|$d" >> result.dat
    done

    cut -d "|" -f 1,3 "result.dat"
else
    echo "Skrypt potrzebuje tylko jednego argumentu lub podana sciezka nie jest folderem"
fi