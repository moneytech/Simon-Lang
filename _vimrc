set nocompatible
filetype off
set exrc

set encoding=UTF-8
filetype plugin indent on

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/L9'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'danwagnerco/tomorrow-theme', {'rtp': 'vim'}
Plug 'zenorocha/dracula-theme', {'rtp': 'vim'}
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ap/vim-css-color'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'python-rope/rope'
Plug 'python-rope/ropemode'
Plug 'python-rope/ropevim'
Plug 'klen/pylama'
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'
" Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json'
Plug 'ekalinin/dockerfile.vim'
Plug 'gregsexton/matchtag'
Plug 'tikhomirov/vim-glsl'
Plug 'nvie/vim-flake8'
call plug#end()

colorscheme gruvbox

" Settings
:set guifont=Consolas:h11:cANSI
set fillchars+=vert:\|
syntax enable
set background=dark
set ruler
set number
set smartindent
set st=4 sw=4 et
set shiftwidth=4
set softtabstop=4
set tabstop=4
let g:vim_json_syntax_conceal = 0
set colorcolumn=80
:set guioptions-=m
:set guioptions-=T
:set guioptions-=r
:set guioptions-=L
:set lines=999 columns=999
:set nobackup
:set noswapfile
:set noundofile
:set nowritebackup
set modelines=0
set expandtab
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set relativenumber
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set list
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
nnoremap <leader>ev <C-w><C-v><C-l>:e
"C:\Users\Simon\Desktop\Skrivbord\P\Vim\_vimrc"<cr>
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'python' ]
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_python_flake8_config_file='.flake8'

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_semantic_triggers =  { 'c' : ['->', '.', '::', 're!gl'], 'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s'] }
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

let g:pymode_indent = 0

au BufRead,BufNewFile *.md setlocal ft=markdown

if has("autocmd")
  filetype on

  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType elm setlocal ts=4 sts=4 sw=4 expandtab
  autocmd GUIEnter * set visualbell t_vb=

endif

let mapleader=" "
map <Leader>ptt :Dispatch py.test %<cr>
map <Leader>pta :Dispatch py.test<cr>
map <Leader>rss :Dispatch bundle exec rspec %<cr>
map <Leader>rsa :Dispatch bundle exec rspec ./spec<cr>
map <Leader>c :ccl<cr>
map <Leader>gs :Gstatus<cr>
map <Leader>gc :Gcommit<cr>

set mouse=c
set shortmess+=A

" Open NERDTREE at startup
" autocmd vimenter * NERDTree