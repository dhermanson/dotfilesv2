#! /bin/bash

echo "inside phpcs.sh"

cd ~/dotfiles/stows/php/repos/github.com/squizlabs/PHP_CodeSniffer
git checkout 3.2.3
composer install
ln -s ~/repos/github.com/squizlabs/PHP_CodeSniffer/bin/phpcs ~/bin/phpcs
ln -s ~/repos/github.com/squizlabs/PHP_CodeSniffer/bin/phpcbf ~/bin/phpcbf
