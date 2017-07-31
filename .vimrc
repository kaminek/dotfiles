"
set nocompatible
filetype off
"
"
"
"
"
"########################################
"""       Vundle plugin manager       """
"########################################
"
" Make Vim more useful
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Use bash shell to avoid plugins manager errors
set shell=/bin/bash
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add other plugins here

" Git tool
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"
" Color themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

" Easy navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" Awesome status line
Plugin 'bling/vim-airline'
Plugin 'ryanoasis/vim-devicons'

" Text objects
Plugin 'terryma/vim-expand-region'

" Misc
Plugin 'pearofducks/ansible-vim'

call vundle#end()
filetype plugin indent on

"########################################
"""       General Configuration       """
"########################################

" Enable syntax highlighting
syntax on

" Set augroup
augroup MyAutoCmd
        autocmd!
augroup END

" Solid line for vsplit separator
set fcs=vert:│

" Set a Dark/light theme
set background=dark
"set background=light

" Colorscheme
colorscheme gruvbox
"colorscheme solarized
"let g:solarized_termtrans=1

" Add Powerline
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts=1

" Set custom font for Gvim
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
        set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Give one virtual space at end of line
set virtualedit=onemore

" Turn on line number
set number

" Always splits to the right and below
set splitright
set splitbelow

" Boost performance of rendering long lines
set synmaxcol=300

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Highlight current line and column
set cursorline
"set cursorcolumn

" Tab settings
set copyindent
set preserveindent
set softtabstop=8
set shiftwidth=8
set tabstop=8
set smarttab

" Show “invisible” characters
"set lcs=tab:   ,trail:·,eol:¬,nbsp:_
"set list

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Auto complete setting
set completeopt=longest,menuone

" Windmenu conf
set wildmode=list:longest,full
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.zip,*.pdf,*.deb
" ...TBC

" Allows buffers to be hidden if you've modified a buffer.
set hidden

" Set backspace config
set backspace=eol,start,indent

" Make search act like search in modern browsers
set incsearch

" Column width indicator
set colorcolumn=80

try
        lang en_us
catch
endtry

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded
" by a DCS sequence
if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Use relative line numbers
if exists("&relativenumber")
        set relativenumber
        au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3


"##########################################
"""       Custom Function/AutoCMD       """
"##########################################

" Strip trailing whitespace (,ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction

"
autocmd MyAutoCmd FileType qf nnoremap <silent> <buffer> q :q<CR>

" json = javascript syntax highlight
autocmd MyAutoCmd FileType json setlocal syntax=javascript

"##############################
"""       Key Mapping       """
"##############################

" Change mapleader
let mapleader = "\<Space>"

" Quit all
nnoremap <Leader>qq :qa<cr>

" Autoformat
nnoremap <silent> <Leader>f :Autoformat<CR>

" NERDTreeFind
nnoremap <silent> <Leader>n :NERDTreeFind<cr> :wincmd p<cr>

" Call StripWhitespace
noremap <leader>ss :call StripWhitespace()<CR>

" Save a fle as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Managing tabs
nnoremap <C-PageDown> :tabprevious<CR>
nnoremap <C-PageUp> :tabnext<CR>
nnoremap <C-t>    :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Next, keep search matches in the middle of the window
nnoremap n nzzzv

" Backspace: Toggle search highlight
nnoremap <bs> :set hlsearch! hlsearch?<cr>

" Reindent entire file
nnoremap R mqHmwgg=G`wzt`q

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" Remove join lines to this, Y looks like a join of two lines into one
noremap Y J

" expand-region
vmap v <Plug>(expand_region_expand)

" shrink-region
vmap <C-v> <Plug>(expand_region_shrink)

" Move cursor left
inoremap <c-h> <Left>

" Move cursor left
inoremap <c-l> <Right>

" Move cursor left
inoremap <c-k> <Up>

" Move cursor left
inoremap <c-j> <Down>


" y: Yank and go to end of selection
xnoremap y y`]

" p: Paste in visual mode should not replace the default register with the
" deleted text
xnoremap p "_dP

" d: Delete into the blackhole register to not clobber the last yank. To
" 'cut', use 'x' instead
xnoremap d "_d

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c

" Toggle folds
inoremap <F1> <C-O>za
nnoremap <F1> za
onoremap <F1> <C-C>za
vnoremap <F1> zf



"######################################
"""       Plugins Management        """
"######################################


""" NerdTree  """

" Open NERDTree automatically when vim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd MyAutoCmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.pyc', '__pycache__', '\.cache', '\.idea']


" Shortcut to open NERDTree
map <C-t> :NERDTreeToggle<CR>

""" NERDTree git-plugin """

" Customize symboles
let g:NERDTreeIndicatorMapCustom = {
                        \ "Modified"  : "✹",
                        \ "Staged"    : "✚",
                        \ "Untracked" : "✭",
                        \ "Renamed"   : "➜",
                        \ "Unmerged"  : "═",
                        \ "Deleted"   : "✖",
                        \ "Dirty"     : "✗",
                        \ "Clean"     : "✔︎",
                        \ "Unknown"   : "?"
                        \ }


""" Airline """

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1


""" Buffers Management  """

" To open a new empty buffer
nmap <leader>t :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Use mapleader to open new file
nnoremap <Leader>o :CtrlP<CR>
" Use mapleader to save file
nnoremap <Leader>w :w<CR>

" Copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
