cd ~/tools/lsp-servers/javascript-typescript-langserver
git checkout v2.5.4
rm -rf node_modules
npm install
npm run build

chmod +x lib/language-server-stdio.js
