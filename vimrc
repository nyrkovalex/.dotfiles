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
set backupcopy=yes

set directory^=$HOME/.vim/tmp//


" Look & feel
let g:aldmeris_termcolors = "tango"
colorscheme aldmeris

set listchars=tab:»\ ,trail:·,space:·
set list
set cursorline
set nowrap
set number
set ruler

set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set cinoptions+=:0


" Statusline
function! StatusLine() abort
  return '%f %m ' . LinterStatus() . '%= %{getcwd()} %#GitStatus#|%{fugitive#head(8)}|%* %l:%v'
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

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  if (l:counts.total == 0)
    return '%#CheckedStatus# ✓ %*'
  endif

  let l:errormsg = all_errors > 0 ? printf('%%#ErrorMsg# %de %%*', all_errors) : ''
  let l:warningmsg = all_non_errors > 0 ? printf('%%#WarningStatus# %dw %%*', all_non_errors) : ''

  return l:errormsg . l:warningmsg
endfunction

let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '×'

highlight ALEErrorSign ctermfg=1 ctermbg=16 cterm=bold
highlight ALEWarningSign ctermfg=3 ctermbg=16
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

highlight BufTabLineActive cterm=None ctermbg=102 ctermfg=0


" Ctrl-P
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_show_hidden = 1

set wildignore+=**/node_modules/**,**/bower_components/**,**/liquibase/**,**/typings/**,**/__pycache__/**,**/*.pyc,**/dist/**


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

" Rename macro
nnoremap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<left><left><left>

" Strip trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"Timestamp shortcuts
nnoremap <A-t> a<C-R>=strftime("%d/%m/%y %H:%M:%S")<CR><Esc>
inoremap <A-t> <C-R>=strftime("%d/%m/%y %H:%M:%S")<CR>


" Languages
" JavaScript
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif


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
