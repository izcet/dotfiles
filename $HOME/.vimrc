""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Isaac Rhett
" Credits:
"   Zaz                 <zaz@staff.42.fr>     ref/42vimrc.vim
"   Gerhard Gappmeier                         ref/prettyvim.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: source on a per-machine basis
source /usr/share/vim/vimfiles/archlinux.vim

filetype off
filetype indent on
filetype plugin indent on
set smartindent
set autoindent

set tabstop=2
set shiftwidth=2

set nocompatible
set encoding=utf-8
set modelines=1
set hidden
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
au BufWrite /private/tmp/crontab.* set nowritebackup
au BufWrite /private/etc/pw.* set nowritebackup
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set expandtab
set t_Co=256
syntax on
set number
set comments=sl:/*,mb:\ *,elx:\ */
set mouse=a
set nospell
set wrap
set textwidth=0 wrapmargin=0

colorscheme elflord
"colorscheme pablo
"colorscheme ron

" insert timestamp
nnoremap <F5> :pu=strftime('%c')<CR>

" qq for faster escapes
inoremap qq <Esc>:
 
autocmd BufEnter *.ino set filetype=c

set cursorline
set scrolloff=9
set history=1000

" auto completion after pressing tab
set wildmenu
set wildmode=list:longest

set foldmethod=syntax

nnoremap <C-S-f> :!firefox %<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deprecated, for reference purposes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" put these in a conditional for only the 42 machines
"autocmd BufNewFile *.c execute "Stdheader"
"autocmd BufNewFile *.cpp execute "Stdheader"
"autocmd BufNewFile *.h execute "Stdheader"
"autocmd BufNewFile *.hpp execute "Stdheader"
"autocmd BufNewFile *.py execute "Stdheader"
"autocmd BufNewFile *.tex execute "Stdheader"
"autocmd BufNewFile *.vim execute "Stdheader"
"autocmd BufNewFile Makefile execute "Stdheader"
  
" browser preview files in chrome on MacOS with ctrl-f
" useful for editing html or opening pdfs
" nnoremap <C-f> :!/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %<CR>

"autocmd BufEnter *.md syntax off
"autocmd BufLeave *.md syntax on
"autocmd BufEnter *.php set filetype=html
