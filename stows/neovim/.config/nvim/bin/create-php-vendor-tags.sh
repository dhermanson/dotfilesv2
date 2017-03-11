#! /bin/bash

ctags -R --fields=K --PHP-kinds=zty --languages=php --exclude=test --exclude=tests --exclude=spec --exclude=specs --exclude=Test --exclude=Tests --exclude=Spec --exclude=Specs -f tags.vendor vendor
