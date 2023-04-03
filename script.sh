#!/bin/bash

#skrypt wyświetlający bieżącą datę
if [ "$1" = "--date" ] || [ "$1" = "-d"; then
  date
fi

#skrypt tworzy 100 plików o rozszerzeniu txt, zapisuje w nich ich nazwę, nazwę skryptuktóry je stworzył oraz datę utworzenia

nazwa_skryptu=$(basename "$0")
data=$(date)
if [ "$1" == "--logs" ] || [ "$1" = "-l" ]; then
  for i in {1..100}; do
  touch log$i.txt;
  echo $data > log$i.txt
  echo "Nazwa pliku:" log$i.txt >> log$i.txt
  echo "Nazwa skryptu:" $nazwa_skryptu >> log$i.txt
  done
fi

#skrypt tworzący 30 plików

data=$(date)
nazwa_skryptu=$(basename "$0")

if [ "$1" = "--logs" ]; then
  if [ "$2" -gt 0 ] 2>/dev/null; then
    for ((i=1; i<=$2; i++)); do
      touch log$i.txt
      echo $data > log$i.txt
      echo log$i.txt >> log$i.txt
      echo $nazwa_skryptu >> log$i.txt
    done
  fi
fi

#skrypt, który wyświetla wszystkie dostępne opcje do komendy git

pomoc=$(git --help)

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  echo $pomoc
fi

if [ "$1" = "--logs" ]; then
  if [ "$2" -gt 0 ] 2>/dev/null; then
    for ((i=1; i<=$2; i++)); do
      mkdir log$i
      touch log$i.txt
      echo $data > log$i/log$i.txt
      echo log$i.txt >> log$i/log$i.txt
      echo $nazwa_skryptu >> log$i/log$i.txt
    done
  fi
fi
