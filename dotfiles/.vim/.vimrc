"---------- Plug
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
call plug#begin('~/.vim/plugged')
    Plug 'tomtom/tcomment_vim'

    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons' 								" Icon
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    Plug 'sheerun/vim-polyglot'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'


"{{ File search }}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 		" Fuzzy finder
    Plug 'junegunn/fzf.vim'

    Plug 'scrooloose/nerdcommenter' " comment fast

    Plug 'airblade/vim-gitgutter' " show git change

    Plug 'neoclide/coc.nvim', {'branch': 'release'} " auto completion

" Themes
Plug 'sainnhe/sonokai'
call plug#end()
"----------
set omnifunc=syntaxcomplete#Complete

set noshowmode
set showcmd
set nobackup
set nowritebackup

set encoding=utf-8
set confirm

set cmdheight=1
set mouse=a
set tabstop=4
set softtabstop=0
set shiftwidth=4
set listchars=tab:\┇\ 		" Tab charactor
set list
set linebreak
set cursorline

set path+=** " search directories upwards and downwards
set wildmenu " hoàn thành dòng lệnh

" Number
set number 
set relativenumber
" Enable hidden buffers
set hidden
" Seach

set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <ESC><ESC> :silent! nohls<CR>

syntax on
let no_buffers_menu=1
set backspace=indent,eol,start
set clipboard=unnamedplus

" delays and poor user experience.
set updatetime=750
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"----------
" Map seach in center line
set scrolloff=999
nnoremap n nzz
nnoremap N Nzz
" Remaps {{{
" command maps{{{
cnoremap jk <c-c>
"}}}
" normal maps{{{
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
"}}}

" insert maps {{{
" open and close char with empty line {{{
inoremap ii' ''<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii" ""<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii( ()<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii) ()<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii[ []<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii] []<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii{ {}<Esc>i<CR><CR><Esc>k<S-s>
inoremap ii} {}<Esc>i<CR><CR><Esc>k<S-s>
"}}}

" open and close char{{{
inoremap <leader>' ''<Esc>i
inoremap <leader>" ""<Esc>i
inoremap <leader>( ()<Esc>i
inoremap <leader>[ []<Esc>i
inoremap <leader>{ {}<Esc>i
"}}}

inoremap jl <Esc>la
inoremap jh <Esc>i
inoremap jj <Esc>A
inoremap jx <Esc>lxi
inoremap jk <Esc>
inoremap jn <Esc>o
inoremap <leader>dd <Esc>ddi
inoremap <leader>> <esc>>>a
inoremap <leader>< <esc><<a
"auto close tag
inoremap <leader>ct </<Esc>2F<lyiwf/pa><Esc>F<i
"auto close tag with empty line
inoremap <leader>cst </<Esc>2F<lyiwf/pa><Esc>F<i<CR><CR><Esc>kS
"markdown code - puts cursor in middle of ```
inoremap ``` ``````<esc>3ha<cr><cr><esc>kS<tab>
"}}}

"----------settings
source ~/.vim/settings/coc.vim
source ~/.vim/settings/fzf.vim
source ~/.vim/settings/airline.vim
source ~/.vim/settings/nerdtree.vim
source ~/.vim/settings/git.vim

"---------- Theme
if has('termguicolors')
	set termguicolors
endif
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_transparent_background = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_diagnostic_virtual_text = 'colored'
let g:sonokai_current_word = 'underline'
let g:sonokai_better_performance = 1

colorscheme sonokai

"----------
"transparent bg
hi Normal guibg=NONE ctermbg=NONE

"change cursor mode i
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
