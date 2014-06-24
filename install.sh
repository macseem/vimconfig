#!/bin/bash

usage() {
  echo "Usage: $0 [-p <string>] [-f] 
Please view README.md for additional information" 1>&2; 
  exit 1;
}
DEST="/home/$USER/.vim"
SRC=$(pwd)
DEPENDENCES=("cscope");
#Scaning args
while getopts "hfp:" optname;
do
	case "$optname" in
	"h") #help
	  usage
	  ;;
	"p") #install path
	  DEST=$OPTARG
	
	  ;;
    "f") #force install (delete old conf)
      FORCE=TRUE
      ;;
	*)
	# Not found
	  usage
	  ;;
	esac
done

#TODO: add check dependences before installation
#Begin Installation
#Destination folder manipulations
if ! [ -d $DEST ]; then
	echo "There is no $DEST."
	mkdir $DEST
else
    if [ ! $FORCE ]; then
        let "OLDDIR=$RANDOM * $RANDOM * $RANDOM"
        OLDDIR="/home/$USER/.vim$OLDDIR"
        mv $DEST $OLDDIR 
        mkdir $DEST
        mv $OLDDIR $DEST"/.oldvim"
        echo "Your old .vim dir was moved to $DEST/.oldvim"
    else
        rm -rf $DEST
        echo "Your old .vim dir removed"
        mkdir $DEST
    fi
fi

echo "Status: [OK]  Task: Make Directory $DEST" 
echo "Install path is set to $DEST"
echo "Start installing"
#copy sources and move or delete old configs
cp -r $SRC/* $DEST/
VIMRC="/home/$USER/.vimrc"
if [ -f $VIMRC ]; then
    echo "There was .vimrc file in $VIMRC"
    if [ ! $FORCE ]; then
        mv "$VIMRC" "$DEST/.oldvimrc"
        echo "It was moved to $DEST/.oldvimrc"
    else
        rm -rf "$VIMRC"    
        echo "It was removed" 
    fi
fi
#create symbol link to ~/.vimrc
ln -s ${DEST}/vimrc /home/$USER/.vimrc
echo "Status: [OK]  Task: Create .vimrc symlink"
#Finishing installation
echo -e "\n\nInstallation Finished"
echo "Please check if these programs are installed"
for program in $DEPENDENCES; do
	echo -e "\t$program"
done
echo "Have a good day. Bye ;)"
