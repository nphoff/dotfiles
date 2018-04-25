" One leader to rule them all!
let mapleader = ","
" Plugins!
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mattn/webapi-vim'
Plug 'urthbound/hound.vim'

Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'

" End plugins!
call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" From blog post about deoplete
let g:deoplete#sources={} 
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips'] 
let g:deoplete#omni#input_patterns={} 
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

"" Hound.vim (<3)
nnoremap <Leader>h :Hound <C-R><C-W><CR>
let g:hound_vertical_split = 1

" fzf default things
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND='ag --ignore .git,tmp -g ""'

noremap <Leader>e :FZF <CR>
noremap <Leader>f :FZF <CR>

" Regular vim stuff
syntax enable                       " Turn on syntax highlighting
set title                           " Change the terminal's title (?)
set expandtab                       " use spaces, not tabs (optional)
set number                          " actually use line numbers
set tabstop=2 
set shiftwidth=2 
set softtabstop=2                   " a tab is 4 spaces
set autoindent
set shiftround                      " Indent to nearest tabstop.
set backspace=indent,eol,start
set encoding=utf-8                  " Default text encoding
set complete=.,w,b,u,t
set background=dark
set scrolloff=3
set wildignorecase
set relativenumber                  " count the relative line numbers from where you are
set noswapfile                      " Self explanatory, don't use swaps.

" auto commands
autocmd BufWritePre *.php,*.js,*.jsx :%s/\s\+$//e
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype javascript set ts=2 sw=2 sts=2 et

nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

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
set pastetoggle=<leader>p
