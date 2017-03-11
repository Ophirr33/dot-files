" Necessary, apparently
set nocompatible
filetype off

" plug
call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-commentary'
Plug 'alessandroyorba/alduin'
Plug 'vim-syntastic/syntastic'
Plug 'Chiel92/vim-autoformat'
Plug 'wlangstroth/vim-racket'
Plug 'leafgarland/typescript-vim'
call plug#end()

filetype plugin indent on

" Backup files are annoying
set nobackup
set nowb
set noswapfile

" history
set history=700

" Vim recommended
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
set synmaxcol=9999
set hidden " Allows you to switch buffers without saving current
set wildmenu
set wildmode=longest:full,full " First tab brings up options, second tab cycles
set encoding=utf8

" Movement
let mapleader = ","
set tm=2000
noremap ,, ,
noremap <Leader>j <C-W>j
noremap <Leader>k <C-W>k
noremap <Leader>l <C-W>l
noremap <Leader>h <C-W>h

" Easier copy and paste
vmap <Leader>y "+y
nmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>p "+p
map <C-V> "+gP
set pastetoggle=<F11>

" treat wrapped lines as different lines
nnoremap j gj
nnoremap k gk

" Enable mouse support
set mouse=a

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show current position
set ruler
set number

" Remove bell
set visualbell

" Better searching
set incsearch
set ignorecase
set smartcase
set wrapscan "wraps around end of file
" Redraw screen and clear highlighting
nnoremap <Leader>r :nohl<CR><C-L>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" tabs
set expandtab
set smarttab

" show whitespace
set list

" Show matching bracket
set showmatch
set mat=2
set shiftwidth=2
set tabstop=2

" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" base16, uncomment when installed
colorscheme alduin

highlight VertSplit guibg=grey guifg=#1c1c1c
highlight LineNr guibg=#1c1c1c

function ClearWhitespace()
  %s/\s\+$//e
endfunction

function Lambda()
  %s/lambda/λ/ge
endfunction

nnoremap <Leader>w :call ClearWhitespace()<CR>
nnoremap <Leader>L :call Lambda()<CR>

" Auto format w/ Scala Fmt
noremap <leader>a :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']

" Syntastic specific checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=["eslint"]
let g:syntastic_rust_checkers=["rustc"]

" Python
" au BufNewFile,BufRead *.py  set tabstop=4  set softtabstop=4  set shiftwidth=4  set textwidth=79  set expandtab  set autoindent  set fileformat=unix
