"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"		  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"		  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"		  ██║   ██║██║██╔████╔██║██████╔╝██║
"		  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"		██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"		╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"##############################################################################
"			General Configuration
"##############################################################################
" {{{

set nocompatible
filetype off

" Set augroup
augroup MyAutoCmd
        autocmd!
augroup END

" Set os type, keep the variable inside this file
let s:os_type = system('uname -s')

" Solid line for vsplit separator
set fcs=vert:│

set laststatus=2
set t_Co=256

" Set custom font for Gvim
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
" set esckeys

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

" No need to backup files anymore
set nobackup
set nowritebackup
set noswapfile

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
set noexpandtab
set softtabstop=8
set shiftwidth=8
set tabstop=8
set smarttab

" Show “invisible” characters
set listchars=tab:\┆\ ,trail:·,precedes:←,extends:→
set list

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
set noshowmode

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

" Enable folding
set foldmethod=indent
set foldlevel=99

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"}}}

"##############################################################################
"			Vundle plugin manager
"##############################################################################
" {{{

" Check plugin manager or warn
" if filereadable(glob("$HOME/.vim/autoload/plug.vim"))
" else
" 	echohl WarningMsg
" 	echo "Vim Plug plugins manager is not installed! please checkout https://github.com/junegunn/vim-plug"
" 	echohl None
" endif


call plug#begin('~/.vim/plugged')
" Add other plugins here

" Git tool
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Ctags
Plug 'majutsushi/tagbar'

" Color themes
Plug 'gruvbox-community/gruvbox'

" Easy navigation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'christoomey/vim-tmux-navigator'

" Awesome status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Text management
Plug 'terryma/vim-expand-region'
Plug 'tmhedberg/SimpylFold'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'nvie/vim-flake8'
Plug 'rust-lang/rust.vim'

" Syntax
Plug 'godlygeek/tabular'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'saltstack/salt-vim', {'for' : 'sls'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'cespare/vim-toml', {'for' : 'toml'}
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'plasticboy/vim-markdown' , {'for' : 'markdown'}
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'uarun/vim-protobuf', {'for' : 'proto'}

" Misc
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()
" }}}

"##############################################################################
"			Colorsheme and fonts
"##############################################################################
" {{{

" Enable syntax highlighting
syntax on
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "hard"

" Set a Dark/light theme
set background=dark
"set background=light

" Colorscheme
" let g:rehash256 = 1
" let g:molokai_original = 1
colorscheme gruvbox

" HL python code
let python_highlight_all=1

" Add 'TODO's markers for highlighting
augroup vimrc_todo
    autocmd!
    autocmd Syntax * syn match MyTodo
        \ /\v<(
        \DEBUG|
        \FIXME|
        \HACK|
        \NOTE|
        \NOTES|
        \OPTIMIZE|
        \REMOVE|
        \TFA|
        \TODO|
        \XXX
        \)/ containedin=.*Comment.* contained
augroup END
highlight def link MyTodo Todo

" Display the highlight group for under the cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" }}}

"##############################################################################
"			Custom Functions/command/AutoCMDs
"##############################################################################
" {{{

" Strip trailing whitespace
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction

" Don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Enable/Disable displaying space and tabs indentation
command! IndentToggle call <SID>IndentationToggle()
function! <SID>IndentationToggle()
	set list!
	:IndentLinesToggle
endfunction

" Ripgrep Next is a more enhanced version with reload fzf
function! RgNextFzf(query)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--preview-window', 'down:30%', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 0, fzf#vim#with_preview(spec))
endfunction

" Rg as cmd
command! -nargs=* -bang RgNext call RgNextFzf(<q-args>)

" Rg with under cursor word
command RgNextCurrWord call RgNextFzf(expand('<cword>'))

autocmd MyAutoCmd FileType qf nnoremap <silent> <buffer> q :q<CR>

" json = javascript syntax highlight
autocmd MyAutoCmd FileType json setlocal syntax=javascript

""Python with virtualenv aware for YouCompleteMe plugin
"python3 << Endpy
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"Endpy

" }}}

"##############################################################################
"			Key Mapping
"##############################################################################

" XXX: This must be correlated with terminal keybinding
" Redefine keymapping on urxvt
if &term =~ "xterm-256color"
	" Generic
	set <Up>=OA
	set <Down>=OB
	set <Right>=OC
	set <Left>=OD
"	set <PageUp>=[5~
"	set <PageDown>=[6~
endif

" Let use qwerty ;)
nnoremap ; :

" Change mapleader
let mapleader = "\<Space>"

" Used for MBP with touch bar
inoremap jj <ESC>

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

" Easy window split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffers Management
" nnoremap <silent> <C-S-tab>    :bprevious<CR>
" nnoremap <silent> <C-PageUp>   :bprevious<CR>
" nnoremap <silent> <C-tab>      :bnext<CR>
" nnoremap <silent> <C-PageDown> :bnext<CR>
nnoremap <silent> qq           :Bclose<cr>
nnoremap <silent> qall         :bufdo Bclose<cr>
nnoremap <silent> rall         :bufdo edit<cr>
" inoremap <silent> <C-S-tab>    <Esc>:bprevious<CR>i
" inoremap <silent> <C-PageUp>   <Esc>:bprevious<CR>i
" inoremap <silent> <C-tab>      <Esc>:bnext<CR>i
" inoremap <silent> <C-PageDown> <Esc>:bnext<CR>i
" open buffers with fzf
nnoremap <leader>b :Buffers<CR>

" Previous/Next location
nnoremap <A-Right> <C-i>
nnoremap <A-Left> <C-o>

" Switch buffers with Alt-Left/Right
nnoremap <Leader>h :bprev<CR>
nnoremap <Leader>l :bnext<CR>
vnoremap <Leader>h :bprev<CR>
vnoremap <Leader>l :bnext<CR>
nnoremap <A-h> :bprev<CR>
nnoremap <A-l> :bnext<CR>
vnoremap <A-h> :bprev<CR>
vnoremap <A-l> :bnext<CR>
" nmap <silent> ˙ :bprev<CR>
" nmap <silent> ¬ :bnext<CR>
" vmap <silent> ˙ <Esc>:bprev<CR>
" vmap <silent> ¬ <Esc>:bnext<CR>

" Resize panes with Shift-Left/Right/Up/Down
nnoremap <silent> <S-Up> :resize +1<CR>
nnoremap <silent> <S-Down> :resize -1<CR>
nnoremap <silent> <S-Right> :vertical resize +1<CR>
nnoremap <silent> <S-Left> :vertical resize -1<CR>
nnoremap <silent> [1;2A :resize +1<CR>
nnoremap <silent> [1;2B :resize -1<CR>
nnoremap <silent> [1;2C :vertical resize +1<CR>
nnoremap <silent> [1;2D :vertical resize -1<CR>

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

" Fugitive maps
" call Ggrep custom function
nnoremap <C-G>g :RgNextCurrWord<CR>
nnoremap <C-G>b :Gblame<CR>

" Open fzf, replace the old CtrlP plugin
nnoremap <C-p> :FZF<CR>

" Use mapleader to save file
nnoremap <Leader>w :w<CR>

" Copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" enable/disable indentation
nnoremap <Leader>i :IndentToggle<CR>

" Allow saving of files as sudo
cmap w!! w !sudo tee > /dev/null %

" CoC
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



"##############################################################################
"			Plugins Management
"##############################################################################


" NerdTree:
" " Open NERDTree automatically when vim starts up
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd MyAutoCmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.pyc', '__pycache__', '\.cache', '\.idea']

" Shortcut to open NERDTree
map <C-t> :NERDTreeToggle<CR>

" NERDTree_git:
" Customize symboles
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

" Airline:
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Let's square everything
let g:airline_left_sep=''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep=''
let g:airline_right_alt_sep = '|'
" Let's use straight buffer tabs
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'
" customize status line
let g:airline_section_x = airline#section#create_right(['filetype'])
let g:airline_section_z = airline#section#create(['%3P ', 'linenr', ':%c'])
" ale integration
let g:airline#extensions#ale#enabled = 1

" Ansible_yml_syntax:
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = 'd'

" IndentLine:
let g:indentLine_char       = '┆'
" let's match color scheme
let g:indentLine_setColors = 1
" Disable by default (can be toggled when needed)
let g:indentLine_enabled = 0

" SimplyFold:
" Enable docstring preview
let g:SimpylFold_docstring_preview = 1

" FZF:
" add fzf bin path
if s:os_type =~ 'Darwin'
  " Installed using homebrew
  set rtp+=/usr/local/opt/fzf
else
  " Installed following github repo
  set rtp+=~/.fzf
endif

" custom window preview
let g:fzf_preview_window = ['down:60%', 'ctrl-/']

" Customize fzf colors to match the current color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Go_vim:
let g:go_highlight_structs = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
"
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0"

" Rust
let g:rustfmt_autosave = 1

" vim colors
let g:Hexokinase_highlighters = ['backgroundfull']