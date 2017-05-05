#! /bin/bash

ctags -R --fields=K --PHP-kinds=zty --languages=php --exclude=vendor --exclude=bootstrap --exclude=_ide_helper.php -f .ctags-php
