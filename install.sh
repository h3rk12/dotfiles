#!/usr/bin/env bash

DOT_FILES=$(cd $(dirname $0); pwd)

cd $DOT_FILES

# Bunch of symlinks

for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue
  ln -snfv "$DOT_FILES/$f" "$HOME"/"$f"
done

ln -sfv "$DOT_FILES/fish" "$HOME/.config/fish"
ln -sfv "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/bash.sh"
. "$DOTFILES_DIR/install/node.sh"
. "$DOTFILES_DIR/install/vundle.sh"

if [ "$(uname)" == "Darwin" ]; then
    . "$DOTFILES_DIR/install/brew-cask.sh"
fi