#! /bin/bash

[ -d ~/.config/nvim ] && echo "Moving old config to ~/nvim-bck" && mv ~/.config/nvim ~/nvim-bck

echo "Linking to ~/.config/nvim"
ln -sfd $(pwd) ~/.config/nvim

