call plug#begin()
Plug 'elmcast/elm-vim'
call plug#end()

call pathogen#infect()

set clipboard=unnamed

colorscheme molokai
set t_Co=256
syntax enable
filetype on
filetype plugin on
filetype plugin indent on
set number
set autoindent
set cindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set foldmethod=syntax
set noswapfile
set nocompatible
set cc=80
set laststatus=2
set ruler
set backspace=indent,eol,start

let g:vim_annotations_offset = '/.liquid/'

let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint', 'liquid']
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:jsx_ext_required = 0

let g:go_disable_autoinstall = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

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
map <C-n> :NERDTreeToggle<CR>
map <F9> :FixWhitespace<CR>

"map <C-b> :GoBuild<CR>
"nmap <F5> :GoRun<CR>

if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif
