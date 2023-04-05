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

if [ "$1" = "--help" ]; then
  echo $pomoc
else
  if [ "$1" = "-h" ]; then
    cat ./README
  fi
fi


if [[ "$1" == "--init" ]]; then
    git clone https://github.com/Sibilabo/LAB4
    echo 'export PATH=$PATH:'$(pwd) >> ~/.bashrc
fi


#skrypt tworzy 100 folderów i plików przy podaniu flagi --error, a przy podaniu flagi -e 30 stworzy 30 takich zestawów


if [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
  for i in {1..100}; do
  mkdir error$i
  touch error$i/error$i.txt;
  echo $data >> error$i/error$i.txt
  echo "Nazwa pliku:" error$i.txt >> error$i/error$i.txt
  echo "Nazwa skryptu:" $nazwa_skryptu >> error$i/error$i.txt
  done
elif [ "$2" = -gt 0 ] 2>/dev/null; then
    for ((i=1; i<=$2; i++)); do
      mkdir error$i
      touch error$i/error$i.txt
      echo $data >> error$i/error$i.txt
      echo log$i.txt >> error$i/error$i.txt
      echo $nazwa_skryptu >> error$i/error$i.txt
    done
  fi
fi
