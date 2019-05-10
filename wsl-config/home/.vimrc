"##############################################################################
"## Vundle config
"##############################################################################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'vhdirk/vim-cmake'
"Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"##############################################################################
"## General settings
"##############################################################################

syntax on
set number
set showmatch

set bs=2

map <C-a> <esc>ggVG<CR>
imap <C-a> <esc>ggVG<CR>

" Powerline Font path
"set rtp+=/mingw64/lib/python3.7/site-packages/powerline/bindings/vim
"set laststatus=2
"set t_Co=256

" Indentation settings
set expandtab
set shiftwidth=4
set softtabstop=4
"set cindent
"set cinoptions=:0,l1,g0,(0,W4,N-s
"set background=dark

let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

set timeoutlen=1000 ttimeoutlen=0

" Clang-format settings
map <C-K> :pyf /mingw64/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /mingw64/share/clang/clang-format.py<cr>
function! Formatonsave()
  let l:formatdiff = 1
  pyf /mingw64/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.hpp,*.hh,*.c,*.cpp,*.cc call Formatonsave()

