syntax enable
set background=dark
colorscheme solarized

set number

" set tabs to 4 spaces and expand
set tabstop=4
set shiftwidth=4
set expandtab

" strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
