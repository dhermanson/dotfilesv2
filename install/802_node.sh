# my-nvm-upgrade
# ~/.nvm/nvm.sh
# nvm install $MY_NVM_VERSION
source ~/.nvm/nvm.sh
nvm install $(echo $MY_NVM_VERSION)

yarn global add aglio
yarn global add eslint
yarn global add gulp-cli
yarn global add harp
yarn global add jshint
yarn global add tern
