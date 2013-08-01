#!/bin/bash

DOT_FILES=( vimrc zshrc zshrc.mine pyrc colorrc )

symlink_dotfiles() {
  for file in $@
  do
    if [ -a $HOME/.$file ]; then
      if [ -L $HOME/.$file ]; then
        echo "既にシンボリックリンクが存在します: .$file"
      elif [ -d $HOME/.$file ]; then
        echo "既にディレクトリが存在します: .$file"
      else
        echo "既にファイルが存在します: .$file"
      fi
    else
      ln -s $HOME/dotfiles/$file $HOME/.$file
      echo "シンボリックリンクを貼りました: .$file"
    fi
  done
}

symlink_dotfiles ${DOT_FILES[@]}
symlink_dotfiles zshrc.mine.*

mkdir -vp $HOME/.vim
mkdir -vp $HOME/.vimbackup
