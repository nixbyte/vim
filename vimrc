set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

filetype plugin indent on 

"----------------------------------------------

"Репозитории на github
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"NerdTree plugin
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'scrooloose/nerdtree-project-plugin'
Plugin 'PhilRunninger/nerdtree-buffer-ops'

"Репозитории vim/scripts
Plugin 'ascenator/L9'
Plugin 'FuzzyFinder'

"гит репозиторий не на гитхаб
"Bundle 'git://git.wincent.com/command-t.git'

"локальный git репозиторий(если работаете над собственным файлом.)
"Bundle 'file:///Users/gmarik/path/to/plugin

call vundle#end()
filetype plugin indent on

"Brief help
" :PluginList -- lists configured plugins
" :PluginInstall - installs plugins; append '!' to update or :PluginUpdate
" :PluginSearch foo - searches for foo; append '!' to refresh local cache
" :PluginClean - confirms removal of unused plugins; append '!' to
" auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non -Plugin stuff after this line
"----------------------------------------------
set shell=sh
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

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
"
" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


"vim-go plugin--------------------------------------"
let mapleader = ","
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_autpo_type_info = 1 

let g:go_auto_sameids = 1
let g:go_highlight_array_whitespaces_error = 1
let g:go_highlight_chan_whitespaces_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_fmt_experimental = 1
let g:go_metalinter_enable = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enable = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

autocmd FileType go inoremap <buffer> . .<C-x><C-o>

map <leader>n :cnext<CR>
map <leader>m :cprevious<CR>
nnoremap <leader>a :cclose<CR>
noremap <leader>c :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>

map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

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

"vim-airline plugin---------------------------------"

let g:airline#extensions#tabline#enable = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"---------------------------------------------------"


 "Установка заднего фона
 syntax on
 colorscheme Atelier_SavannaDark 
" color blue
set background=dark
set t_Co=256
" highlight Normal ctermbg=Black  ctermfg=White
 "Включаем мышку
 set mouse=a
 "Всегда отображать статусную строку для каждого окна
 set laststatus=2

 function! CleverTab()
   if pumvisible()
     return "\<C-N>"
   endif
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
     return "\<Tab>"
   elseif exists('&omnifunc') && &omnifunc != ''
     return "\<C-X>\<C-O>"
   else
     return "\<C-N>"
   endif
 endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
