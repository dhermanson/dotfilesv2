if exists('g:loaded_deh_composer')
  finish
endif

let g:loaded_deh_composer = 1

function! deh#composer#setup(project_name)
  nnoremap <leader>pmtp :Dispatch $HOME/.config/nvim/bin/create-php-ctags.sh<CR>
  nnoremap <leader>pmtv :Dispatch $HOME/.config/nvim/bin/create-php-vendor-tags.sh<CR>
endfunction
