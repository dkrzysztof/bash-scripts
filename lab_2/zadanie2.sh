#!/bin/bash

if [ -d $1 ] && [ "$#" -eq 1 ]
then

    bash ./sc1.sh $1
    # Przy załączeniu opcji kopiowania dowiązań symbolicznych(-d):
    # link ze ścieżką bezwzgledną działał poprawnie
    # link ze ścieżką względną przestał działać. Wyświetlał się na czerwono w drzewku.
    # W przypadku nie sprecyzowania opcji kopiowania, oba wiazania przestawały się odnośić do plików.
    cp -d $1/E/{link_bez_plik1,link_plik3} $1/A/C

    # plik na ktory wskazuje plik link_bez_plik2
    # plik link_bez_plik2 nie byl stworzony, dlatego skrypt wyrzuca błąd,
    # plik link_bez_plik1 juz jest stworzony i dla takiego kopiuje sie zalinkowany plik do wskazanego folderu
    cp "$(readlink -f $1/E/link_bez_plik1)" $1/A/C/

else
    echo "Skrypt potrzebuje tylko jednego argumentu lub podana sciezka nie jest folderem"
fi