"---------- Plug
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/.vim/plugged')
	source ~/.vim/.vimrc.plug
call plug#end()
"----------
set noshowmode
set encoding=utf-8
set confirm
set nobackup
set nowritebackup
set cmdheight=1
set mouse=a 
set tabstop=4
set softtabstop=0
set shiftwidth=4
"set listchars=tab:\|-\ 		" Tab charactor
"set list
set linebreak
set cursorline
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
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"----------
" Map seach in center line
set scrolloff=999
nnoremap n nzz
nnoremap N Nzz
" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"----------settings
source ~/.vim/setting/coc.vim
source ~/.vim/setting/fzf.vim
source ~/.vim/setting/airline.vim
source ~/.vim/setting/nerdtree.vim
source ~/.vim/setting/floaterm.vim
source ~/.vim/setting/auto-pairs.vim

"---------- Theme
if has('termguicolors')
	set termguicolors
endif
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
"let g:everforest_disable_italic_comment = 1
"let g:everforest_cursor = 'green'
"let g:everforest_transparent_background = 1
"let g:everforest_sign_column_background = 'none'
let g:everforest_ui_contrast = 'high'
"let g:everforest_show_eob = 0
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_diagnostic_virtual_text = 'colored'
let g:everforest_current_word = 'underline'
let g:everforest_better_performance = 1
set background=dark
colorscheme everforest
"----------
