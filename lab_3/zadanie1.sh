#!/bin/bash
if [ -d $1 ] && [ "$#" -eq 1 ]
then
    # usuwanie zawartości w podanym katalogu
    rm -rf $1/*
    # tworzenie plików do teststowania zadania
    touch $1/obraz{1..3}.jpg $1/obraz{1..3}.png $1/dokument{1..3}.pdf $1/test{1..6}.jpg
    mkdir $1/test{1..2}
    touch $1/test1/obraz.jpg $1/test2/obraz.png
    
    echo 
    echo "zadanie 1 a"
    find $1 -name "*test*" -type f | head -3 | sort

    echo 
    echo "zadanie 1 b"
    find $1 -type f \( -name "*.jpg" -o -name "*.png" \) | while read file
    do 
        echo `realpath $file` | tr "/" "|"
    done
    
    echo 
    echo "zadanie 1 c"
    find $1 -maxdepth 2 -type f -mmin +1 -exec echo Deleting {} \; -exec rm -rf {} \;
    echo '--end--'

else
    echo "Skrypt potrzebuje tylko jednego argumentu lub podana sciezka nie jest folderem"
fi