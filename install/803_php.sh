composer global update
composer global install

docker pull phpstan/phpstan

pushd
cd ~/.local/share/psysh
wget http://psysh.org/manual/en/php_manual.sqlite
popd

pushd
cd ~/dotfiles/stows/php/repos/github.com/phpstan/phpstan
git checkout 0.9.2
composer install
popd

pushd
cd ~/dotfiles/stows/php/repos/github.com/nikic/PHP-Parser
git checkout v4.0.1
composer install
ln -s ~/dotfiles/stows/php/repos/github.com/nikic/PHP-Parser/bin/php-parse ~/bin/php-parse
popd

for file in ./php/*; do
    if [[ -f $file && -x $file ]]; then
	($file)
    fi
done
