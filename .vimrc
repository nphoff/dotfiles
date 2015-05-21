set nocompatible                    " choose no compatibility with legacy vi

" Vundle.
" Reminder, before having vundle, you need to run this:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Might want a script at some point to do that first

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'derekwyatt/vim-scala'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
"


 " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable                       " Turn on syntax highlighting
set title                           " Change the terminal's title (?)
set expandtab                       " use spaces, not tabs (optional)
set relativenumber                  " count the relative line numbers from where you are
set number                          " actually use line numbers
set tabstop=4 shiftwidth=4          " a tab is 4 spaces
set autoindent
set shiftround                      " Indent to nearest tabstop.
set backspace=indent,eol,start
set encoding=utf-8                  " Default text encoding
set autochdir                       " Automagically change directory to open file
set noswapfile                      "Self explanatory, don't use swaps.
set cursorline
let g:netrw_liststyle=3             " netrw list style
colorscheme default

"Leader
let mapleader = ","

"autocmd FileType php,js autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre *.php,*.js,*.jsx :%s/\s\+$//e
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
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
set wildmenu
set wildmode=list:longest
set wildignore=.git,*.swp,*/tmp/*
set wildignorecase

"" remaps
"" brings matches to the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
noremap j gj
noremap k gk
map  ; :
nmap > >>
nmap < <<

"" don't look, emacs bindings :/
noremap <C-a> ^
noremap <C-e> $


""" folding
set foldmethod=syntax
set foldlevelstart=20
set foldnestmax=2

let javaScript_fold=1         " JavaScript
"let perl_fold=1               " Perl
"let php_folding=1             " PHP
"let r_syntax_folding=1        " R
"let ruby_fold=1               " Ruby
"let sh_fold_enabled=1         " sh
"let vimsyn_folding='af'       " Vim script
"let xml_syntax_folding=1      " XML
"
""" netrw settings
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 2
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

"" my function
let g:journal_mode = 1
function Journal()
    let journal_time = strftime("%b_%d_%Y")
    let filename = journal_time . '.md'
    let path = '~/journal/'
    if g:journal_mode
        execute 'sp ' . path . filename
        let g:journal_mode = 0
    else
        execute 'bd ' . path . filename 
        let g:journal_mode = 1
    endif
endfunction

"nnoremap <leader>s :Ag<CR>
nnoremap <leader>s :Ggrep <cword> *<CR>
nnoremap <leader>j :call Journal()<CR>
set pastetoggle=<leader>p

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif


