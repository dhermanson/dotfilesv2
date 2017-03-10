" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Colors
Plug 'morhetz/gruvbox'

" Essentials
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

