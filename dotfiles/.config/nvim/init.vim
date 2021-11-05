" Plugins{{{
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

Plug 'plasticboy/vim-markdown'

"{{ File search }}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 		" Fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdcommenter' "comment fast

Plug 'airblade/vim-gitgutter' "show git change

Plug 'neoclide/coc.nvim', {'branch': 'release'} " auto completion

Plug 'chrisbra/NrrwRgn' " Edit selected text in new window/tab/region

Plug 'voldikss/vim-floaterm'  " Float termina
" Themes
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'dylanaraps/wal.vim'
Plug 'mhartington/oceanic-next'
Plug 'wadackel/vim-dogrun'
Plug 'arzg/vim-colors-xcode'
call plug#end()
"}}}

" Settings{{{
" enable syntax and plugins (for netrw)
syntax enable
syntax on

set omnifunc=syntaxcomplete#Complete
set noshowmode
set noswapfile
set confirm
set encoding=utf-8
set mouse=a
let mapleader = ","

set number
set relativenumber

set termguicolors " Enables 24-bit RGB color

set list
set listchars=tab:\┇\ 		" Tab charactor
set shiftwidth=4
set softtabstop=0
set tabstop=4
set linebreak

set path+=** " search directories upwards and downwards
set wildmenu " hoàn thành dòng lệnh

set hidden
set incsearch
set hlsearch
set smartcase " automatically switch to case-sensitive when using uppercase
set ignorecase

set cursorline

set lazyredraw " screen will not redraw while executing macros
set formatoptions+=j " always uses spaces instead of tab characters
set backspace=indent,eol,start
set clipboard+=unnamedplus " ALWAYS use the clipboard for ALL operations no need to specify '+' and/or '*' registers 

set scrolloff=999 " allway center
"}}}

" Remaps {{{

" command maps{{{
cnoremap jk <c-c>
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

" normal maps{{{
" Map seach in center line
nnoremap n nzz
nnoremap N Nzz

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
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up>    :resize +2<CR>
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

" operator maps{{{

" using <c-u> to remove the range that vim may insert
" operators act on the vim range or when using <c-u>, the selected range

" delete around next word
onoremap anw :<c-u>normal! wvaw<cr>
" delete around next Word
onoremap anW :<c-u>normal! WvaW<cr>
" delete inner next word
onoremap inw :<c-u>normal! wviw<cr>
" delete inner next Word
onoremap inW :<c-u>normal! WviW<cr>

" around next bracket
onoremap an[ :<c-u>normal! f[va[<cr>
" around last bracket
onoremap al[ :<c-u>normal! F[va[<cr>
" inside next bracket
onoremap in[ :<c-u>normal! f[vi[<cr>
" inside last bracket
onoremap il[ :<c-u>normal! F[vi[<cr>

" around next bracket
onoremap an{ :<c-u>normal! f{va{<cr>
" around last bracket
onoremap al{ :<c-u>normal! F{va{<cr>
" inside next bracket
onoremap in{ :<c-u>normal! f{vi{<cr>
" inside last bracket
onoremap il{ :<c-u>normal! F{vi{<cr>

" around next parenthesis
onoremap an( :<c-u>normal! f(va(<cr>
" around last parenthesis
onoremap ap( :<c-u>normal! F(va(<cr>
" inside next parenthesis
onoremap in( :<c-u>normal! f(vi(<cr>
" inside last parenthesis
onoremap ip( :<c-u>normal! F(vi(<cr>

" around next single quote
onoremap an' :<c-u>normal! f'va'<cr>
" around last single quote
onoremap ap' :<c-u>normal! F'va'<cr>
" inside next single quote
onoremap in' :<c-u>normal! f'vi'<cr>
" inside last single quote
onoremap ip' :<c-u>normal! F'vi'<cr>

" around next double quote
onoremap an" :<c-u>normal! f"va"<cr>
" around last double quote
onoremap ap" :<c-u>normal! F"va"<cr>
" inside next double quote
onoremap in" :<c-u>normal! f"vi"<cr>
" inside last double quote
onoremap ip" :<c-u>normal! F"vi"<cr>}}}

" terminal maps{{{
tnoremap jk <C-\><C-n>
"}}}

" session maps{{{
nnoremap <leader>ms :NERDTreeClose<cr>:mks! ~/.config/nvim/sessions/
nnoremap <leader>os :so ~/.config/nvim/sessions/
"}}}

" wip mappings{{{
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
" search for current word under cursor w/ results opening in quickfix window
" :nnoremap <leader>gw :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen 5<cr>
" search for current Word under cursor w/ results opening in quickfix window
" :nnoremap <leader>gW :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 5<cr>
" edit vim file
" }}}

" plugins mappings{{{

" CtrlP - Easy bindings for its various modes
nnoremap <leader>bb :CtrlPBuffer<cr>
nnoremap <leader>bm :CtrlPMixed<cr>
nnoremap <leader>bs :CtrlPMRU<cr>
" NerdTree
nnoremap <c-n> :NERDTreeFind<CR>zz<c-w><c-p>
nnoremap <c-space> :NERDTreeToggle<CR>
"NarrowRegion
" Open the current visual window in a new narrowed window
nnoremap <leader>nw :NW<CR>
" AG
nnoremap <leader>ag :Ag "}}}
"}}}

" Automatically save folds{{{
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END
"}}}

" Git Gutter Mappings & Settings{{{
nmap <leader>gj ]c
nmap <leader>gk [c
nmap <leader>gs <leader>hs
nmap <leader>gu <leader>hu
nmap <leader>gp <leader>hp

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'm'
let g:gitgutter_sign_removed = 'd'
let g:gitgutter_sign_removed_first_line = 'rf'
let g:gitgutter_sign_modified_removed = 'mr'
"}}}

" Abbreviations{{{
iabbr cs2log const {log} = console;
"}}}

" NERDTree Mappings & Settings{{{
let g:NERDTreeIgnore = ['^node_modules$']
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && g:NERDTree.IsOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

augroup NerdTreeSettings
  autocmd! 
  autocmd VimEnter * NERDTree "opens NerdTree when vim stars
  autocmd VimEnter * wincmd p "sets to Prev Window
  "autocmd BufEnter * call SyncTree()
  autocmd FileType nerdtree setlocal relativenumber
augroup END

" Highlight currently open buffer in NERDTree

let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "m",
    \ "Staged"    : "s",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "u",
    \ "Deleted"   : "d",
    \ "Dirty"     : "m",
    \ "Clean"     : "c",
    \ 'Ignored'   : 'i',
    \ "Unknown"   : "?"
    \ }
"}}}

" Coc Settings{{{
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-emmet', 'coc-prettier']
" coc plugins
" if hidden is not set, TextEdit might fail.
set hidden

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'results:50' " overcome limit imposed by max height

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=750

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

"" Trigger configuration. Do not use <tab> if you use
"" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger='<c-space>'

"" shortcut to go to next position
"let g:UltiSnipsJumpForwardTrigger='<c-j>'

"" shortcut to go to previous position
"let g:UltiSnipsJumpBackwardTrigger='<c-k>'


let g:ctrlp_regexp = 1
" Buffers go back to prev
" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  :Format<CR>
nmap <leader>f  :Format<CR>
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"}}}

" Themes{{{
let g:gruvbox_italic=1
" let g:gruvbox_improved_strings=1
let g:gruvbox_invert_indent_guides=1
let g:gruvbox_contrast_dark='soft'

" colorscheme solarized
colorscheme gruvbox
" colorscheme dracula
" colorscheme dogrun
" colorscheme xcodedarkhc
" colorscheme onehalfdark
" colorscheme nord
" colorscheme one
" colorscheme OceanicNext
" colorscheme wal
set encoding=UTF-8
 "dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666
"}}}

" Visual Text Macros{{{
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
"}}}

" Set File Types{{{
augroup SetFileType
  autocmd!
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  " tsconfig.json is actually jsonc, help TypeScript set the correct filetype
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
augroup END
"}}}

" Airline Settings{{{
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'
"}}}

" vim-markdown folding{{{
let g:vim_markdown_folding_disabled = 1
"}}}

" Vimscript file settings {{{
augroup filtetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Pandoc Markdown To Pdf {{{
function! PandocMarkdownToPdf()
  " .expand('%:r') gets root file name and % gets full filename
  " something like this -> !pandoc -o somefilename.pdf somefilename.md
  write!
  sleep ".1s"
  execute "!pandoc -o ".expand('%:r').".pdf ".expand('%')
endfunction

augroup Pandoc
  autocmd!
  autocmd FileType markdown nnoremap <buffer> ,p :call PandocMarkdownToPdf()<CR><CR>
augroup END
"}}}

" GuiCursor{{{
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
 \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
 \,sm:block-blinkwait175-blinkoff150-blinkon175
"}}}

" Set Background - Leave at bottom of file {{{
hi Normal guibg=NONE ctermbg=NONE
"}}}
