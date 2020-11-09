set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on 

"----------------------------------------------

"Репозитории на github
Bundle 'tpope/vim-fugitive'
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'fatih/vim-go'

"Репозитории vim/scripts
Bundle 'L9'
Bundle 'FuzzyFinder'

"гит репозиторий не на гитхаб
"Bundle 'git://git.wincent.com/command-t.git'

"локальный git репозиторий(если работаете над собственным файлом.)
"Bundle 'file:///Users/gmarik/path/to/plugin

"----------------------------------------------

:set t_Co=256

set tabstop=2
set shiftwidth=2
set noexpandtab
set softtabstop=2
set autoindent
set smartindent
set showcmd
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set hlsearch
set incsearch
set nowrapscan
set ignorecase
set nobackup
set noswapfile
set nu
set listchars=tab:··
set encoding=utf-8
set fileencodings=utf-8,koi8-r,cp1251,cp866
set smartindent cinwords=fi,elif,else,for,while,try,except,finally,dev,class,with
set cursorline
set nostartofline
set hidden

set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

nmap <silent> <S-f> <Plug>ToggleProject

"vim-go plugin--------------------------------------"
let mapleader = ","
let g:go_fmt_command = "goimports"


map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)

function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0,1)
	elseif l:file =~ '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>


"---------------------------------------------------"

 "Установка заднего фона
 syntax on
 colorscheme CandyPaper
" color blue
"set background=light
"set t_Co=256
" highlight Normal ctermbg=Black  ctermfg=White
 "Включаем мышку
 set mouse=a
 "Всегда отображать статусную строку для каждого окна
 set laststatus=2


