# my-nvm-upgrade
# ~/.nvm/nvm.sh
# nvm install $MY_NVM_VERSION
source ~/.nvm/nvm.sh
nvm install $MY_NVM_VERSION
nvm alias default $MY_NVM_VERSION

npm install -g npm
npm install -g yarn

npm install -g bower
npm install -g eslint
npm install -g gulp-cli
npm install -g harp
npm install -g jshint
npm install -g lodash
npm install -g typescript
npm install -g vscode-json-languageservice
# yarn global add tern
# yarn global add jsctags

# yarn global add bower
# yarn global add eslint
# yarn global add gulp-cli
# yarn global add harp
# yarn global add jshint
# # yarn global add tern
# # yarn global add jsctags
# yarn global add lodash
# yarn global add typescript
# yarn global add vscode-json-languageservice
