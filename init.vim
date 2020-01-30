" One leader to rule them all!
let mapleader = ","
" Plugins!
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mattn/webapi-vim'
Plug 'nphoff/hound.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
" CoC
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'

Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'moll/vim-node', { 'for': 'javascript' }

" End plugins!
call plug#end()

"" Hound.vim (<3)
nnoremap <Leader>h :Hound <C-R><C-W><CR>
let g:hound_vertical_split = 1

let g:hound_repo_paths = {
      \'Mailchimp': '/Volumes/casesensitive/mailchimp'}

let g:hound_repos = "Mailchimp"
let g:hound_preserve_repo_case = 1

" vim-rhubarb (enables :Gbrowse)
let g:github_enterprise_urls = ['https://git.rsglab.com']

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
set mouse=a                         " enable the mouse for all modes. :D

set undodir=~/.vim/undodir
set undofile
set clipboard=unnamed

" Color scheme
colorscheme solarized
set background=dark

" auto commands
autocmd BufWritePre *.php,*.js,*.jsx :%s/\s\+$//e
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.md CocDisable
autocmd BufNewFile,BufReadPost *.md set cmdheight=1
autocmd BufNewFile,BufReadPost *.txt CocDisable
autocmd BufNewFile,BufReadPost *.txt set cmdheight=1
autocmd Filetype javascript set ts=2 sw=2 sts=2 et
autocmd Filetype php set ts=4 sw=4 sts=4 et
autocmd Filetype php set includeexpr=substitute(v:fname,'[\_]','/','g').'.php'
autocmd Filetype php set path+=/Volumes/casesensitive/mailchimp/app/controllers/
autocmd Filetype php set path+=/Volumes/casesensitive/mailchimp/app/lib/
autocmd Filetype php set path+=/Volumes/casesensitive/mailchimp/app/models/
autocmd Filetype php set path+=/Volumes/casesensitive/mailchimp/vendor/rsg/avesta/src/
au BufRead,BufNewFile Vagrantfile setfiletype ruby

" highlight bad words
highlight badWords ctermbg=red ctermfg=white
fun! HiBadWords()
match badWords /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfun
autocmd InsertEnter *.md call HiBadWords()
autocmd InsertLeave *.md call HiBadWords()

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

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

"" netrw
""let g:netrw_liststyle = 3

"" Cursor stuff
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

""" Journal things
function TopThree()
    let date = strftime("%a, %b %d, %Y")
    call append("$", '')
    call append("$", '# ' . date)
    call append("$", '')
    call append("$", "Top three things for the day:")
    call append("$", '')
    call append("$", "[ ]")
    call append("$", "[ ]")
    call append("$", "[ ]")
endfunction

nnoremap <leader>t :call TopThree()<CR>

"" CoC

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" END CoC

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

