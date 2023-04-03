#!/bin/bash

#skrypt wyświetlający bieżącą datę
if [ "$1" = "--date" ]; then
  date
fi

#skrypt tworzy 100 plików o rozszerzeniu txt, zapisuje w nich ich nazwę, nazwę skryptuktóry je stworzył oraz datę utworzenia

nazwa_skryptu=$(basename "$0")
data=$(date)
if [ "$1" == "--logs" ]; then
  for i in {1..100}; do
  touch log$i.txt;
  echo $data > log$i.txt
  echo "Nazwa pliku:" log$i.txt >> log$i.txt
  echo "Nazwa skryptu:" $nazwa_skryptu >> log$i.txt
  done
fi
