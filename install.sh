#!/usr/bin/env bash

DOT_FILES=$(cd $(dirname $0); pwd)

cd $DOT_FILES

for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue
  ln -snfv "$DOT_FILES/$f" "$HOME"/"$f"
done
