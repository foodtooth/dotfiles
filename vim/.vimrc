"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle and Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set autoread

" Fast saving
nmap <leader>w :w<cr>

set wildmenu
set wildignore=*.o,*~,*.pyc,*/tmp/*,*.so,*.swp,*.zip

set hidden
set showcmd
set nostartofline
set ruler
set laststatus=2
set confirm
set cmdheight=2
set lazyredraw
set showmatch
set number

set mouse=a

set backspace=indent,eol,start

set foldmethod=indent foldcolumn=4
set foldenable
set foldlevelstart=5
set foldnestmax=10

" Map Y to act like D and C, rather than act as yy
map Y y$

" Omni completion
set omnifunc=syntaxcomplete#Complete

" Save cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" The matchit plugin makes the % command work better, but it is not backwards compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" Let increment and decrement work on alphabetic character
set nrformats+=alpha


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase smartcase
set incsearch

" Visual mode pressing * searches for the current selection

" Redraw screen and turn off search highlighting until the next search
nnoremap <leader>l :nohl<CR><C-L>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" quickfix list
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

" Mappings to access buffers
nnoremap <leader>- :bp<CR>
nnoremap <leader>= :bn<CR>
nnoremap <leader>g :b#<CR>

" Close current buffer
nnoremap <leader>d :bp\|bd #<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab smarttab
set wrap linebreak nolist
set breakindent showbreak=..
set autoindent smartindent

augroup fileType
  autocmd!

  " For all text files set 'textwidth' to 79 characters.
  autocmd FileType text setlocal textwidth=79

  " Set indentation to particular filetype
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.ejs setlocal filetype=html

augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8 ffs=unix,dos,mac

set nobackup		" do not keep a backup file, use versions instead
set undofile	" keep an undo file (undo changes after closing)
set nowb
set noswapfile

" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
if !exists("g:syntax_on")
  syntax enable
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch

  " set 256-color-effect colorscheme
  set t_Co=256
  set background=dark
  colorscheme solarized
  " colorscheme molokai
endif

let &colorcolumn="+1,+".join(range(41,401),",+")
" hi ColorColumn ctermbg=lightgrey guibg=lightgrey

set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----- YCM related settings ----- "
let g:ycm_server_log_level = 'debug'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_extra_conf_globlist = ['/usr/share/vim/*','!/*']
let g:ycm_autoclose_preview_window_after_completion = 1

" ----- vim-airline related settings ----- "
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled = 1

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled=1


" ----- ntpeters/vim-better-whitespace settings ----- "
" Strip all trailing whitespace on file save for file types
augroup vimBetterWhitespace
  autocmd!
  autocmd BufEnter * EnableStripWhitespaceOnSave
augroup END
" let g:better_whitespace_filetypes_blacklist+=['<filetype1>', '<filetype2>', '<etc>']

" ----- nathanaelkane/vim-indent-guides settings ----- "
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" Set indent guide color for terminal vim with dark colorscheme
let g:indent_guides_auto_colors = 0
augroup vimIndentGuides
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=236
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=237
augroup END

" ----- mileszs/ack.vim settings ----- "
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ----- scrooloose/nerdtree settings ----- "
augroup nerdTree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  autocmd BufEnter * if winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif
augroup END

map <C-n> :NERDTreeToggle<CR>

let NERDTreeChDirMode = 2

" ----- ctrlpvim/ctrlp.vim settings ----- "
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:0'

" ----- heavenshell/vim-jsdoc ----- "
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_param_description_separator = ' - '
let g:jsdoc_tags = {} | let g:jsdoc_tags['returns'] = 'return'


" ----- othree/javascript-libraries-syntax.vim ----- "
let g:used_javascript_libs = 'underscore,chai'


" ----- w0rp/ale ----- "
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
