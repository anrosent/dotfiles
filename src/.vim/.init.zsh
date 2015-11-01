#!/bin/zsh
RDIR=$(dirname $0)

PLUGIN_REPOS_F=$RDIR/repos.txt
mkdir -p $RDIR/bundle

while read line;
do
    echo ".vim: Dependency $line"
    if [ ! -d "bundle/$(basename ${line%.*})" ];
    then
        echo "cloning $line into .vim"
        pushd $RDIR/bundle
        git clone $line
        popd
    else
        echo "Dependency already satisfied"
    fi
done < $PLUGIN_REPOS_F
