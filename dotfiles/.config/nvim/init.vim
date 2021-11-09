" Plug {{{
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
call plug#begin('~/.vim/plugged')
    Plug 'sainnhe/edge'

    "{{ The Basics }}
    Plug 'itchyny/lightline.vim'                        " Lightline statusbar
    Plug 'mengelbrecht/lightline-bufferline'

    Plug 'frazrepo/vim-rainbow'
    Plug 'scrooloose/nerdcommenter' " comment fast
    "{{ File management }}
    Plug 'scrooloose/nerdtree'                          " Nerdtree
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                       " Icons for Nerdtree
    "{{ Git }}"
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter' " show git change
    "{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                           " Change surrounding marks
    "{{ Syntax Highlighting and Colors }}
    Plug 'sheerun/vim-polyglot'
    "{{ Complention }}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}     " auto completion
    "{{ File search }}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 		" Fuzzy finder
    Plug 'junegunn/fzf.vim'
call plug#end() "}}}

" => General Settings {{{
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set nocompatible                " be iMproved, required
filetype off                    " required

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.

set ignorecase
set smartcase
set hlsearch
set incsearch                   " Incremental search

set noshowmode                  " Uncomment to prevent non-normal modes showing in powerline and below powerline.
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set nowritebackup

set confirm
set linebreak
set cursorline
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set termguicolors
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax on
let g:rehash256 = 1
set laststatus=2                " Always show statusline

" Text, tab and indent related
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

" Mouse Scrolling
set mouse=nicr
set mouse=a

" Map seach in center line
set scrolloff=999
nnoremap n nzz
nnoremap N Nzz

" Splits and Tabbed Files
set splitbelow splitright
" delays and poor user experience.
set updatetime=750
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set fillchars+=vert:\   " Removes pipes
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"     
"}}}

" Remaps {{{
" Command maps {{{
cnoremap jk <c-c>
" }}}

" Normal maps{{{
" start command with history
nnoremap ; q:i
" start search with history
nnoremap <leader>/ q/i
nnoremap <leader>ve :e $MYVIMRC<cr>
" source vime file
nnoremap <leader>vs :so $MYVIMRC<cr>
" add semicolon to end of line w/o losing location
nnoremap <leader>; mlA;<esc>`l
nnoremap <ESC><ESC> :silent! nohls<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up>    :resize -2<CR>
" change pwd to directory of current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <space>r :set relativenumber!<CR>
nnoremap <space>n :set number!<CR>
" use enter key to repeat last macro
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'
nnoremap <leader><leader> :b#<CR>
nnoremap <leader>o :only<CR>
noremap <C-w>h <C-w>H
noremap <C-w>j <C-w>J
noremap <C-w>k <C-w>K
noremap <C-w>l <C-w>L
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap cc <C-w>c
noremap <leader>q :q<CR>
noremap <leader>s :w<CR>
nnoremap go o<Esc>
nnoremap gO O<Esc>j
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>bq :bp <BAR> bd #<CR>
"j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap Y y$
" }}}

" Insert maps {{{
" Open and close char with empty line {{{
inoremap ii' ''<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii" ""<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii( ()<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii) ()<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii[ []<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii] []<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii{ {}<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii} {}<Esc>i<CR><CR><Esc>k<S-s>
" }}}

" Open and close char {{{
inoremap i' ''<Esc>i
inoremap i" ""<Esc>i
inoremap i( ()<Esc>i
inoremap i[ []<Esc>i
inoremap i{ {}<Esc>i
inoremap a' ''<Esc>a
inoremap a" ""<Esc>a
inoremap a( ()<Esc>a
inoremap a[ []<Esc>a
inoremap a{ {}<Esc>a
" }}}

" Else {{{
inoremap ll <Esc>la
inoremap hh <Esc>i
inoremap jj <Esc>ja
inoremap kk <Esc>ka
inoremap ju <Esc>ua
inoremap ja <Esc>A
inoremap jx <Esc>lxi
inoremap jo <Esc>o
inoremap jO <Esc>O
inoremap <leader>dd <Esc>ddi
inoremap <leader>> <Esc>>>a
inoremap <leader>< <Esc><<a
"auto close tag
inoremap <leader>ct </<Esc>2F<lyiwf/pa><Esc>F<i
"auto close tag with empty line
inoremap <leader>cst </<Esc>2F<lyiwf/pa><Esc>F<i<CR><CR><Esc>kS
"markdown code - puts cursor in middle of ```
inoremap ``` ``````<esc>3ha<cr><cr><esc>kS<tab>
" }}}
" }}}
" }}}

" Settings {{{
source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/git.vim
" }}}

" Vimscript file settings folding {{{
augroup filtetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Colorscheme {{{
"hi Normal guibg=NONE ctermbg=NONE
"let g:edge_transparent_background = 1
let g:edge_menu_selection_background = 'purple'
let g:edge_diagnostic_text_highlight = 1
let g:edge_diagnostic_line_highlight = 1
let g:edge_diagnostic_virtual_text = 'colored'
let g:edge_current_word = 'underline'
let g:edge_better_performance = 1
colorscheme edge
"}}}
