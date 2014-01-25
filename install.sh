#!/bin/bash

usage() {
  echo "Usage: $0 [-p <stging>] 
Please view README.md for additional information" 1>&2; 
  exit 1;
}
DEST="/home/$USER/.vim"
SRC=$(pwd)
DEPENDENCES=("cscope");
while getopts "hp:" optname;
do
	case "$optname" in
	"h") #help
	  usage
	  ;;
	"p") #install path
	  DEST=$OPTARG
	
	  ;;
	*)
	# Соответствий не найдено
	  usage
	  ;;
	esac
done

if ! [ -d $DEST ]; then
	echo "There is no $DEST."
	mkdir $DEST
else
	let "OLDDIR=$RANDOM * $RANDOM * $RANDOM"
	OLDDIR="/home/$USER/.$OLDDIR"
	mv $DEST $OLDDIR 
	mkdir $DEST
	mv $OLDDIR $DEST"/.oldvim"
	echo "Your old .vim dir was moved to $DEST/.oldvim"
fi

echo "Status: [OK]  Task: Make Directory $DEST" 
echo "Install path is set to $DEST"
echo "Start installing"

cp -r $SRC/* $DEST/
VIMRC="/home/$USER/.vimrc"
if [ -f $VIMRC ]; then
	mv "$VIMRC" "$DEST/.oldvimrc"
	echo "There was .vimrc file in $VIMRC"
	echo "It was moved to $DEST/.oldvimrc"
fi

ln -s ${DEST}/vimrc /home/$USER/.vimrc
echo "Status: [OK]  Task: Create .vimrc symlink"

echo -e "\n\nInstallation Finished"
echo "Please check if these programs are installed"
for program in $DEPENDENCES; do
	echo -e "\t$program"
done
echo "Have a good day. Bye ;)"
