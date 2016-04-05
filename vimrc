execute pathogen#infect()

syntax on

filetype plugin on
filetype indent on

set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set virtualedit=all
set linespace=2
set laststatus=2
set foldmethod=syntax
set foldlevel=20
set expandtab
set splitright
set backspace=2
set hls
set mouse=a
set diffopt+=vertical
set clipboard=unnamed


" Look & feel
colorscheme solarized
set background=dark

set listchars=tab:»\ ,trail:·
set list
set cursorline
set nowrap
set number
set ruler

set statusline=%f\ %m\ %#SyntasticErr#%{SyntasticStatuslineFlag()}%*%=\ %{getcwd()}\ %#GitStatus#\|%{fugitive#head(8)}\|%*\ %l:%v
set omnifunc=syntaxcomplete#Complete

highlight CursorLine cterm=None ctermbg=0
highlight SpecialKey cterm=None ctermbg=None ctermfg=0
highlight VertSplit ctermfg=0 ctermbg=8
highlight LineNr ctermfg=0 ctermbg=8
highlight TablineFill ctermbg=8 ctermfg=0
highlight TablineSel cterm=None ctermfg=7 ctermbg=9
highlight Tabline cterm=None ctermfg=7 ctermbg=0
highlight StatusLine cterm=None ctermfg=7 ctermbg=9
highlight NonText cterm=None ctermfg=0
highlight GitStatus ctermbg=0 ctermfg=7
highlight SyntasticErr ctermbg=3 ctermfg=7


" split navigation
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>


" Ack grep
let g:ackprg = 'ag --vimgrep'


" buftabline
set hidden
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>
nnoremap <silent> <C-Q> :bd<CR>

let g:buftabline_indicators = 1
let g:buftabline_show = 1


" Command-T
set wildignore+=node_modules,**/node_modules/**,**/bower_components/**,**/public/**,**/liquibase/**,**/typings/**,**/__pycache__/**,**/*.pyc
let g:CommandTTraverseSCM = 'pwd'


" syntastic
let g:syntastic_stl_format='|!%e ?%w|'


" Handy stuff
" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Rename macro
nnoremap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<left><left><left>
" Strip trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
"Timestamp shortcuts
nnoremap <A-t> a<C-R>=strftime("%d/%m/%y %H:%M:%S")<CR><Esc>
inoremap <A-t> <C-R>=strftime("%d/%m/%y %H:%M:%S")<CR>


" TypeScript
let g:syntastic_typescript_checkers=['tslint']
autocmd FileType typescript nnoremap <buffer> <C-h> :echo tsuquyomi#hint()<CR>


" JavaScript
let g:syntastic_javascript_checkers = ['eslint']


" Python
autocmd FileType python setlocal sw=4 sts=4
