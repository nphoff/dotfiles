set nocompatible                    " choose no compatibility with legacy vi

" Leader
let mapleader = ","

" All of my plugins are here.
if filereadable($HOME . "/.vimrc.plugins")
    source ~/.vimrc.plugins
endif

syntax enable                       " Turn on syntax highlighting
set title                           " Change the terminal's title (?)
set expandtab                       " use spaces, not tabs (optional)
set number                          " actually use line numbers
set tabstop=4 
set shiftwidth=4 
set softtabstop=4                   " a tab is 4 spaces
set autoindent
set shiftround                      " Indent to nearest tabstop.
set backspace=indent,eol,start
set encoding=utf-8                  " Default text encoding
set autochdir                       " Automagically change directory to open file
set noswapfile                      " Self explanatory, don't use swaps.
" set cursorline                      " Put a line under the current row...
set mouse=a
let g:netrw_liststyle=3             " netrw list style
" take out the included files, it was taking too long
set complete=.,w,b,u,t
set background=dark
colorscheme solarized

" Change shape of cursor in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical line in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

set scrolloff=3


"autocmd FileType php,js autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre *.php,*.js,*.jsx :%s/\s\+$//e
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.tpl set filetype=html tabstop=4 shiftwidth=4
autocmd BufNewFile,BufReadPost *.jinja2 set filetype=html tabstop=2 shiftwidth=2

" Autocmd for working with alluvium's js
autocmd Filetype javascript set ts=2 sw=2 sts=2 et

" Take off highlights with escape twice
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"" Searching
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
set wildignore=.git,*.swp,*/tmp/*,*/dist/*

"" remaps
"" brings matches to the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap gb :ls<CR>:b<Space>
noremap j gj
noremap k gk
noremap s <C-w>
nmap > >>
nmap < <<

"" don't look, emacs bindings :/
noremap <C-a> ^
noremap <C-e> $

"" experimental settings for page nav
noremap J <C-d>
noremap K <C-u>

""" new things
if v:version >= 704
    set wildignorecase
    set relativenumber                  " count the relative line numbers from where you are
endif

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

let g:notes = 1
function Notes()
    let filename = 'journal.md'
    let path = '~/notes/'
    if g:notes
        execute 'sp ' . path . filename
        let g:notes = 0
    else
        execute 'bd ' . path . filename 
        let g:notes = 1
    endif
endfunction

nnoremap <Leader>w :w<CR>
nnoremap <leader>j :call Journal()<CR>
nnoremap <leader>n :call Notes()<CR>
set pastetoggle=<leader>p

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif


