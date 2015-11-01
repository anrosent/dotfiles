#!/bin/zsh
RDIR=$(dirname $0)
PLUGIN_REPOS_F=$RDIR/repos.txt

mkdir -p $RDIR/bundle

while read line;
do
    DST="$RDIR/bundle/$(basename ${line%.*})"
    if [ ! -d $DST ];
    then
        echo ".vim: cloning dependency $line into $DST"
        pushd $RDIR/bundle
        git clone $line
        popd
    else
        echo ".vim: Dependency $line already satisfied"
    fi
done < $PLUGIN_REPOS_F
