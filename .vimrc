syntax on

set laststatus=2
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h20
set tabstop=4
set autoindent
set cindent
set shiftwidth=4
set number
set runtimepath^=~/.vim/bundle/ctrlp.vim
set nocompatible              " be iMproved, required

autocmd vimenter * NERDTree

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/webapi-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'matze/vim-move'
Plugin 'scrooloose/syntastic'
Plugin 'jmcantrell/vim-diffchanges'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'


call vundle#end()


let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

let ind = indent(prevnonblank(v:lnum - 1))

syntax on
colorscheme onedark
let g:clang_library_path='/usr/lib64/libclang.so.3.9'

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <C-S-U> :edit! <CR>

nmap <A>l <Plug>(easymotion-w)
nmap <Space>f <Plug>(easymotion-f)
nmap <Space>l <Plug>(easymotion-j)
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Mouse Click
set mouse=a
