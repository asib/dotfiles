" Install Pathogen
" "http://www.vim.org/scripts/script.php?script_id=2332"
" Unzip pathogen.zip, then $ mv ./autoload ~/.vim/
call pathogen#infect()

" MOLOKAI THEME
" $ mkdir ~/.vim/colors
" $ cd !$
" $ wget "https://raw.githubusercontent.com/fatih/molokai/master/colors/molokai.vim"
set t_Co=256
colorscheme molokai

" VIM-GO PLUGIN
" $ mkdir ~/.vim/bundle
" $ cd !$
" git clone https://github.com/fatih/vim-go.git
syntax enable
filetype plugin on
set number
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" TAGBAR
" Install ctags
" $ sudo apt-get install ctags
" Install go parser
" $ go get -u github.com/jstemmer/gotags
" Install tagbar plugin
" $ cd ~/.vim/bundle
" $ git clone https://github.com/majutsushi/tagbar.git
let g:tagbar_autofocus = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <F8> :TagbarToggle<CR>

" Install nerdtree file browser
" $ cd ~/.vim/bundle
" $ git clone https://github.com/scrooloose/nerdtree.git
map <C-n> :NERDTreeToggle<CR>

" FIXWHITESPACE
" $ cd ~/.vim/bundle
" $ git clone https://github.com/bronson/vim-trailing-whitespace
" :FixWhitespace to fix
map <F9> :FixWhitespace<CR>

" NERDCommenter
" $ cd ~/.vim/bundle
" $ git clone https://github.com/scrooloose/nerdcommenter
let NERDSpaceDelims=1

nmap <F5> :GoRun<CR>

set autoindent
set cindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=syntax
set noswapfile
set nocompatible
