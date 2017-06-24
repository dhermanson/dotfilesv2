#! /bin/bash

find ./resources/assets/js -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > .ctags-js

