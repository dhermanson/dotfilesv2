composer global update
composer global install

docker pull phpstan/phpstan

cd ~/.local/share/psysh
wget http://psysh.org/manual/en/php_manual.sqlite

# cd ~/.emacs.d
# mkdir php-language-server
# cd php-language-server
# composer require felixfbecker/language-server

cd ~/dotfiles/stows/php/repos/github.com/phpstan/phpstan
git checkout 0.9.2
composer install

cd ~/dotfiles/stows/php/repos/github.com/nikic/PHP-Parser
git checkout v4.0.1
composer install
ln -s ~/dotfiles/stows/php/repos/github.com/nikic/PHP-Parser/bin/php-parse ~/bin/php-parse
