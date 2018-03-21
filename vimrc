execute pathogen#infect()

language en_US
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
set backupcopy=yes
set noswapfile

set directory^=$HOME/.vim/tmp//


" Look & feel
colorscheme aldmeris

set listchars=tab:»\ ,trail:·,space:·
set list
set cursorline
set nowrap
set number
set ruler

set omnifunc=syntaxcomplete#Complete
set completeopt-=preview


" Statusline
function! StatusLine() abort
  let l:lintermsg = '%#CheckedStatus#%{LinterOk()}' . '%#ErrorMsg#%{LinterErrors()}' . '%#WarningStatus#%{LinterWarnings()}%*'
  return '%f %m ' . l:lintermsg . '%= %#GitStatus#|%{fugitive#head(8)}|%* %l:%v'
endfunction

set statusline=%!StatusLine()


" split navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l


" ALE
highlight CheckedStatus ctermbg=2
highlight WarningStatus ctermbg=3 ctermfg=0

function! LinterOk() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:total = l:counts.total + youcompleteme#GetErrorCount() + youcompleteme#GetWarningCount()
  return l:total == 0 ? ' ✓ ' : ''
endfunction

function! LinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error + youcompleteme#GetErrorCount()

  return all_errors > 0 ? printf(' %de ', all_errors) : ''
endfunction

function! LinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error + youcompleteme#GetWarningCount()
  let l:all_non_errors = l:counts.total - l:all_errors

  return all_non_errors > 0 ? printf(' %dw ', all_non_errors) : ''
endfunction

let g:ale_sign_column_always = 1
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '×'
let g:ale_lint_delay = 500

nnoremap <leader>e :ALENextWrap<cr>
nnoremap <leader>E :ALEPreviousWrap<cr>


" Ack grep
let g:ackprg = 'ag --vimgrep'


" buftabline
set hidden
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>
nnoremap <silent> <C-Q> :bd<CR>

let g:buftabline_indicators = 1
let g:buftabline_show = 1


" Ctrl-P
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_current_file = 1
" exclude gitignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

set wildignore+=**/node_modules/**,**/bower_components/**,**/liquibase/**,**/__pycache__/**,**/*.pyc,**/dist/**

" YCM
let g:ycm_error_symbol = g:ale_sign_error
let g:ycm_warning_symbol = g:ale_sign_warning
let g:ycm_show_diagnostics_ui = 0


" Handy stuff
" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Copy to clipboard
vmap <C-C> "+y
nmap <C-C> "+yy
vmap <leader>d "_d
nmap <leader>d "_d

" Rename macro
nnoremap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<left><left><left>

" Strip trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"Timestamp shortcuts
nnoremap <A-t> a<C-R>=strftime("%d/%m/%y %H:%M:%S")<CR><Esc>
inoremap <A-t> <C-R>=strftime("%d/%m/%y %H:%M:%S")<CR>


" Languages
" JavaScript
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

autocmd FileType javascript nnoremap <buffer> <leader>f :!eslint --fix %<CR>:e<CR>

" Python
autocmd FileType python setlocal sw=4 sts=4
nmap <A-i> :!isort %<CR> :e<CR>

" Go
let g:ycm_gocode_binary_path = "$GOPATH/bin/gocode"
autocmd FileType go nnoremap <A-t> :GoTest<CR>
autocmd FileType go inoremap <A-t> :GoTest<CR>
autocmd FileType go nnoremap <leader>r :GoRename<CR>

" Elm
" Disable elm-vim keybindings
let g:elm_setup_keybindings = 0

let g:ycm_semantic_triggers = {
  \ 'elm' : ['.'],
  \ }

autocmd FileType elm nmap <leader>f :ElmFormat<CR>
autocmd FileType elm nmap <leader>e :ElmErrorDetail<CR>
autocmd BufWritePre *.elm :ElmFormat

" Typescript
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
autocmd FileType typescript nmap <buffer> <leader>f :ALEFix<CR>
autocmd FileType typescript nmap <buffer> <leader>q :YcmCompleter GetType<CR>
autocmd FileType typescript nmap <buffer> <leader>r :YcmCompleter RefactorRename <C-r><C-w>
autocmd FileType typescript nmap <buffer> gd :YcmCompleter GoToDefinition <CR>
autocmd FileType typescript nmap <buffer> <leader>d :YcmShowDetailedDiagnostic<CR>
let g:ale_linters = { 'typescript': ['tslint', 'tsserver'] }
let g:ale_fixers = { 'typescript': ['tslint'] }

source ~/.dotfiles/local.vim
