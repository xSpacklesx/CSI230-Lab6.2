#!/bin/bash

# file converter.sh
# brief  a script that returns an uppercase or lowecase version of a file
# author Hunter Spack
# Lab 6.2
# date 10/10/2020


usage()
{
  echo "$0 usage: [ -f inputfile ] [ -c U(pper) or L(owwer) ]"
  exit 1

}

while getopts ":f:c:" options;
  do
    case "${options}" in
  f)
    f=${OPTARG}
    if [[ !(-e $f) ]]; then
      usage
    else
      echo "File ${f} found"
    fi
  ;;

  c)
    c=${OPTARG}
    if [[ $c == "U" || $c == "L" ]]; then
      echo "${f} - ${c}"
    else
      usage
    fi
  ;;

  *)
    usage
  ;;
    esac

done

#conversion logic

while read line
do

  if [ ${c} == "U" ]; then
    echo $line | tr [:lower:] [:upper:]
  else
    echo $line | tr [:upper:] [:lower:]
  fi


done < $f

exit 0
