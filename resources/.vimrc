"------Vundle--------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

"------NERDTree Plugin--------
let NERDTreeMapOpenInTab='<C-t>'
let NERDTreeShowHidden=1

"------Airline Plugin--------
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1

"------YCM--------
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
set completeopt -=preview

"------General Settings--------
syntax enable
set number 

"------Mappings--------
map  <silent> <C-Up> :tabn<CR>
map  <silent> <C-Down> :tabp<CR>
map  <silent> <C-t> :tabe 
nmap <silent> <C-n> :NERDTreeToggle<CR>
map  **<Tab> :Files<CR>
