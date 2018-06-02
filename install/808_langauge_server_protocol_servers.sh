# js/ts langserver
mkdir -p ~/tools/lsp-servers
pushd .
cd ~/tools/lsp-servers/javascript-typescript-langserver
git checkout v2.5.5
rm -rf node_modules
npm install
npm run build

chmod +x lib/language-server-stdio.js
