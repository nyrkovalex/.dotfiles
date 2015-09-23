execute pathogen#infect()

syntax on

filetype plugin on
filetype indent on

colorscheme solarized
set background=dark

set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set virtualedit=all
set linespace=2
set laststatus=2
set foldmethod=syntax
set foldlevel=20

" Special chars
set listchars=tab:»\ ,trail:·
set list

"Indent by parenthesis
" set cino=(0

set cursorline
set nowrap
set number
set ruler
set splitright

set statusline=»\ %{getcwd()}%=[%{fugitive#head(8)}]\ %l:%v
set omnifunc=syntaxcomplete#Complete

highlight CursorLine cterm=None ctermbg=0
highlight StatusLineNC cterm=None ctermbg=0
highlight SpecialKey cterm=None ctermbg=None ctermfg=0

"Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Copy paste
map <S-Insert> "+gP
map <C-Insert> "+y

" Strip trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"Timestamp shortcuts
nnoremap <A-t> a<C-R>=strftime("%d/%m/%y %H:%M:%S")<CR><Esc>
inoremap <A-t> <C-R>=strftime("%d/%m/%y %H:%M:%S")<CR>

" Command-T excludes
set wildignore+=**/node_modules/**,**/bower_components/**,**/ace/**,**/public/**

" Easy grep exludes
let g:EasyGrepFilesToExclude=".svn,.git,**/node_modules/**,**/bower_components/**"

" Syntax options
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"lw-"]

"autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2

