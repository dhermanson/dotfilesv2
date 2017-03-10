#! /bin/bash
for file in $HOME/dotfiles/stows/*; do
  stow --ignore ".DS_Store" -t $HOME -d $HOME/dotfiles/stows $( basename $file )
done

