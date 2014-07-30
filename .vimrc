set nocompatible                    " choose no compatibility with legacy vi
syntax enable                       " Turn on syntax highlighting
set expandtab                       " use spaces, not tabs (optional)
set relativenumber                  " count the relative line numbers from where you are
set number                          " actually use line numbers
set tabstop=4 shiftwidth=4          " a tab is 4 spaces
set autoindent
set backspace=indent,eol,start
set encoding=utf-8                  " Default text encoding
set autochdir                       " Automagically change directory to open file

autocmd FileType php autocmd BufWritePre <buffer> :%s/\s\+$//e
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"" Searching
set nohlsearch                  " Search highlighting is super annoying
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

""statusline
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set statusline=
set statusline=%-3.3n           " buffer number
set statusline+=%t              " tail of the filename
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%y              " filetype
set statusline+=%=              " left/right separator
set statusline+=%c,             " cursor column
set statusline+=%l/%L           " cursor line/total lines
set statusline+=\ %P            " percent through file

"" File completion
set wildmode=list:longest       " Complete the longest common match and show
                                " a list of possible matches
set wildignorecase 

"" remaps
"" brings matches to the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


