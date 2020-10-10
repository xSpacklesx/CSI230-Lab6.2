#!/bin/bash

# file hostlookup.sh
# brief  a script that returns public ip of hosts from file
# author Hunter Spack
# Lab 6.2
# date 10/10/2020


usage()
{
  echo "$0 usage: [-f input file]"
  exit 1
}

while getopts ":f:" options;
do
    case "${options}" in
      f)
        f=${OPTARG}
        if [[ !(-e ${f}) ]]; then
	  usage
        else
	  echo "File ${f} found"
        fi
      ;;

      *)
	  usage
      ;;
    esac
done

while read line
do
  out=$(host -W1 -t A $line)
    if [ $? -eq 0 ]; then
        ip=$(echo $out | cut -d " " -f 4)
        echo $line - $ip
    else
        echo "${line} does not have a DNS A record"
    fi
done < $f

exit 0
