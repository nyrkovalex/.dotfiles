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
set clipboard=unnamedplus

set directory^=$HOME/.vim/tmp//


" Look & feel
colorscheme solarized
set background=dark

set listchars=tab:»\ ,trail:·
set list
set cursorline
set nowrap
set number
set ruler

set statusline=%f\ %m\ %#ErrorMsg#%{neomake#statusline#LoclistStatus()}%*%=\ %{getcwd()}\ %#GitStatus#\|%{fugitive#head(8)}\|%*\ %l:%v
set omnifunc=syntaxcomplete#Complete

highlight SpecialKey cterm=None ctermbg=None ctermfg=0
highlight VertSplit ctermfg=0 ctermbg=None
highlight LineNr ctermfg=0 ctermbg=None
highlight TablineFill cterm=None ctermbg=None
highlight TablineSel cterm=None ctermfg=7 ctermbg=9
highlight Tabline cterm=None
highlight StatusLine cterm=None ctermfg=7 ctermbg=9
highlight NonText cterm=None ctermfg=0
highlight GitStatus ctermbg=None ctermfg=None
highlight NeomakeErrorSign ctermfg=1
highlight ErrorMsg cterm=None ctermbg=3 ctermfg=7


" split navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l


" Ack grep
let g:ackprg = 'ag --vimgrep'


" buftabline
set hidden
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>
nnoremap <silent> <C-C> :bd<CR>

let g:buftabline_indicators = 1
let g:buftabline_show = 1


" Ctrl-P
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = ''

set wildignore+=node_modules,**/node_modules/**,**/bower_components/**,**/public/**,**/liquibase/**,**/typings/**,**/__pycache__/**,**/*.pyc


" Neomake
autocmd! BufWritePost * Neomake

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
let g:neomake_typescript_checkers=['tslint']
autocmd FileType typescript nnoremap <buffer> <C-/> :echo tsuquyomi#hint()<CR>


" JavaScript
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif


" Python
autocmd FileType python setlocal sw=4 sts=4
