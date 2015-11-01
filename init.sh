#!/bin/bash

pushd $(dirname $0)

RESOURCE_DIR="$(dirname $0)/src"
INIT_SCRIPT=".init.zsh"

# So we can get dotfiles
shopt -s dotglob

echo "Installing resources"
for f in $RESOURCE_DIR/*;
do

    # Make symlinks into $HOME
    SRC=$(readlink -f `pwd`/$f)
    DST=~/$(basename $f)
    ln -s $SRC $DST
    echo "Symlinked $DST -> $SRC"

    # If resource is a directory, run optional init.sh
    if [ -d $f ];
    then
        if [ -x $f/$INIT_SCRIPT ];
        then
            echo "Running init script for $f"
            ./$f/$INIT_SCRIPT;
        fi
    fi
done

# Make container for bulk dependencies
if [ -d deps ];
then
    mkdir deps
fi

while read line
do
    DST=`echo $line | cut -d ' ' -f1`
    URL=`echo $line | cut -d ' ' -f2`
    if [ ! -a ~/$DST ];
    then
        git clone --recursive $URL "deps/$DST"
        SRC=$(readlink -f "deps/$DST")
        ln -s $SRC ~/$DST
    else
        echo "Dependency $line already satisfied"
    fi
done < deps.txt
