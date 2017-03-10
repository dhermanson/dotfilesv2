for file in ../stows/*; do
  stow -t $HOME -d ../stows $( basename $file )
done

