set nocompatible
filetype off

call plug#begin()
Plug 'Chiel92/vim-autoformat'
Plug 'GEverding/vim-hocon'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'jremmen/vim-ripgrep'
call plug#end()

filetype plugin indent on
runtime ftplugin/man.vim

" Spell checking
set spelllang=en

" Backup files are annoying
set nobackup
set nowritebackup
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

" Playing around with having these off
" set number
" set cursorcolumn
" set cursorline


" Remove bell
set visualbell
set t_vb=

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

" nowrap
set nowrap

" Show matching bracket
set showmatch
set matchtime=2
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

function! Json()
  :%!jq --sort-keys .
endfunction

" CtrlP using ripgrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" base16, uncomment when installed
colorscheme badwolf

set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

function ClearWhitespace()
  %s/\s\+$//e
endfunction

function Lambda()
  %s/lambda/λ/ge
endfunction

nnoremap <Leader>W :call ClearWhitespace()<CR>
nnoremap <Leader>L :call Lambda()<CR>

" Ale syntax checking
let g:ale_java_checkstyle_options = '-c ~/.checkstyle.xml'
let g:ale_rust_cargo_use_check = 1
" Save battery by only running on saving/entering files
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-l> :tabn<CR>
nmap <silent> <C-h> :tabp<CR>


" Pane movement/organization
noremap <Leader>h <C-W>h
noremap <Leader>j <C-W>j
noremap <Leader>k <C-W>k
noremap <Leader>l <C-W>l

noremap <Leader>H <C-W>H
noremap <Leader>J <C-W>J
noremap <Leader>K <C-W>K
noremap <Leader>L <C-W>L

" Resize panes
noremap <Leader>a :vertical resize -10<CR>
noremap <Leader>d :vertical resize +10<CR>
noremap <Leader>s :resize -10<CR>
noremap <Leader>w :resize +10<CR>

" Page left and right
nnoremap <C-L> 40zl
nnoremap <C-H> 40zh

" Scalafmt
nnoremap <leader>o :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']
