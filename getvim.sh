#!/bin/bash

VIM_CLONE_DIR=$HOME/vim

git clone https://github.com/vim/vim.git $VIM_CLONE_DIR

cd $VIM_CLONE_DIR/src && make configure && make && make install && rm -rf $VIM_CLONE_DIR

git clone https:://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \

vim +PluginInstall +qall	
