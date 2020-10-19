if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12
  endif
endif

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('kien/ctrlp.vim')
  call dein#add('nyrkovalex/vim-aldmeris')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('w0rp/ale')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ap/vim-buftabline')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('mileszs/ack.vim')
  call dein#add('moll/vim-node')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

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
set completeopt=menu

set directory^=$HOME/.vim/tmp//

" Look & feel
"set termguicolors
let g:aldmeris_transparent = 1
set bg=dark
colorscheme aldmeris
highlight CheckedStatus ctermbg=2
highlight WarningStatus ctermbg=3 ctermfg=0

set listchars=tab:»\ ,trail:·,space:·
set list
set cursorline
set nowrap
set number
set ruler
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" Strip trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Statusline
function! LinterOk() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? ' ✓ ' : ''
endfunction

function! LinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error

  return all_errors > 0 ? printf(' %d× ', all_errors) : ''
endfunction

function! LinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return all_non_errors > 0 ? printf(' %d⚠ ', all_non_errors) : ''
endfunction

function! StatusLine() abort
  let l:lintermsg = '%#CheckedStatus#%{LinterOk()}' . '%#ErrorMsg#%{LinterErrors()}' . '%#WarningStatus#%{LinterWarnings()}%*'
  return '%t %m ' . l:lintermsg . '%= %#GitStatus#|%{fugitive#head(8)}|%* %l:%v'
endfunction

set statusline=%!StatusLine()

" Split navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Completion
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
let g:deoplete#enable_at_startup = 1

" Ack grep
let g:ackprg = 'ag --vimgrep'

" Buftabline
set hidden
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>
nnoremap <silent> <C-Q> :bd<CR>

let g:buftabline_indicators = 1
let g:buftabline_show = 1

" Ale
let g:ale_sign_column_always = 1

let g:ale_sign_column_always = 1
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '×'
let g:ale_lint_delay = 500

nmap <leader>e :ALENextWrap<cr>
nmap <leader>E :ALEPreviousWrap<cr>
let g:ale_linters = { 'typescript': ['tslint', 'tsserver'], 'html': [] }
let g:ale_fixers = { 'typescript': ['tslint'] }

" Rename macro
nmap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<left><left><left>

" Ctrl-p
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_current_file = 1
" exclude gitignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" TypeScript
let g:nvim_typescript#diagnostics_enable = 0
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'
autocmd FileType typescript nmap <buffer> gd :TSDef<CR>zz
autocmd FileType typescript nmap <buffer> <leader>d :TSDoc<CR>
autocmd FileType typescript nmap <buffer> <leader>r :TSRename<CR>
autocmd FileType typescript nmap <buffer> <leader>f :ALEFix<CR>
autocmd FileType typescript nmap <buffer> <leader>F :TSImport<CR>

