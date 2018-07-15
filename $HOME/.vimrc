""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Zaz <zaz@staff.42.fr>
" Description: Default 42 school vim configuration
" Original: ref/42vimrc.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
"set noexpandtab
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Gerhard Gappmeier
" Description: prettyvim configuration
" Original: ref/prettyvim.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set autoindent
set expandtab
"set textwidth=120
set t_Co=256
syntax on
set number
set comments=sl:/*,mb:\ *,elx:\ */

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Probably me
" Description: Things I found in my old .vimrc that I decided to leave here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
set nospell
set wrap
set textwidth=0 wrapmargin=0

colorscheme pablo
"colorscheme elflord " pretty good also
"colorscheme ron " 42 mac default?

" restore terminal contents on exit
" https://forums.vandyke.com/showthread.php?t=3431
"if &term =~ "xterm"
    " SecureCRT versions prior to 6.1.x do not support 4-digit DECSET
    "     let &t_ti = "\<Esc>[?1049h"
    "     let &t_te = "\<Esc>[?1049l"
    " Use 2-digit DECSET instead
"    let &t_ti = "\<Esc>[?47h"
"    let &t_te = "\<Esc>[?47l"
"endif

" TODO put these in a conditional for only the 42 machines
"autocmd BufNewFile *.c execute "Stdheader"
"autocmd BufNewFile *.h execute "Stdheader"
"autocmd BufNewFile Makefile execute "Stdheader"
"autocmd BufNewFile *.py execute "Stdheader"
"autocmd BufNewFile *.cpp execute "Stdheader"
"autocmd BufNewFile *.hpp execute "Stdheader"
"autocmd BufNewFile *.tex execute "Stdheader"
"autocmd BufNewFile *.vim execute "Stdheader"

"autocmd BufEnter *.md syntax off
"autocmd BufLeave *.md syntax on
"autocmd BufEnter *.php set filetype=html
autocmd BufEnter *.ino set filetype=c

" browser preview files in chrome on MacOS with ctrl-f
" useful for editing html or opening pdfs
nnoremap <C-f> :!/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %<CR>

" insert timestamp
nnoremap <F5> :pu=strftime('%c')<CR>

" no idea what these are
"nnoremap <C-k> :!/Applications/Spotify.app <CR>
":noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
