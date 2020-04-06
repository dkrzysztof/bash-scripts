#!/bin/bash
if [ -d $1 ] && [ "$#" -eq 1 ]
then 
    # usuwanie plików i katalogów 
    rm -rf $1/*

    # tworzenie pliku plik2.txt i katalogów 
    mkdir {$1/A,$1/A/B}
    echo "Test 2" >> $1/A/B/plik2.txt

    # tworzenie pliku plik3.txt i katalogów 
    mkdir {$1/A/C,$1/A/C/D}
    echo "Test 3" >> $1/A/C/D/plik3.txt

    # tworzenie pliku plik1.txt
    echo "Test 1" >> $1/A/plik1.txt

    # tworzenie pliku plik4.txt i katalogów 
    mkdir $1/E
    echo "Test 4" >> $1/E/plik4.txt

    # sciezki bezwzględne
    ln -s "$(readlink -f $1)/A/plik1.txt" "$1/E/link_bez_plik1" 
    ln -s "$(readlink -f $1)/E/plik4.txt" "$1/E/link_bez_plik4" 

    # sciezki wzgledne
    ln -s "../plik1.txt" "$1/A/B/link_plik1"
    ln -s "../A/B/plik2.txt" "$1/E/link_plik2"
    ln -s "../A/C/D/plik3.txt" "$1/E/link_plik3"
    ln -s "../../../E/plik4.txt" "$1/A/C/D/link_plik4"

else
    echo "Skrypt potrzebuje tylko jednego argumentu lub podana sciezka nie jest folderem"
fi
