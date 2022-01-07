#!/usr/bin/env bash

DOT_FILES=$(cd $(dirname $0); pwd)

cd $DOT_FILES

for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue
  ln -snfv "$DOT_FILES/$f" "$HOME"/"$f"
done

# for fish
cd $DOT_FILES/fish

for f in *
do
  ln -snfv "$(pwd)/$f" "$HOME/.config/fish/$f"
done

cd -

# for vim
# cd $HOME/.vim

# for f in *
# do
#   ln -snfv "$(pwd)/$f" "$HOME/.config/nvim/$f"
# done
ln -snfv ~/.vimrc ~/.config/nvim/init.vim
