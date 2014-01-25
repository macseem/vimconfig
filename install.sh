#!/bin/bash

usage() {
  echo "Usage: $0 [-p <stging>] 
Please view README.md for additional information" 1>&2; 
  exit 1;
}
INSTALLPATH="/home/$USER/.vim"
while getopts "hp:" optname;
do
	case "$optname" in
	"h") #help
	  usage
	  ;;
	"p") #install path
	  INSTALLPATH=$OPTARG
	  ;;
	*)
	# Соответствий не найдено
	  usage
	  ;;
	esac
done

echo "Install path is set to $INSTALLPATH"
