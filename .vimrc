set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'VundleVim/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-latex/vim-latex'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-fugitive'

"Plugin 'davidhalter/jedi-vim'
"Plugin 'cjrh/vim-conda'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Show whitespace
" " MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" for iterm2
set t_Co=256

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

set encoding=utf-8
let python_highlight_all=1
let fortran_free_source=1
let fortran_do_enddo=1

syntax on
if has('gui_running')
	set background=dark
	colorscheme solarized
    else
	colorscheme zenburn
endif
call togglebg#map("<F5>")
set nu

let g:jedi#completions_command = "<Tab>"
"let g:jedi#force_py_version = 2
"let g:UltisnipsUsePythonVersion = 2

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
" " I like to have it here becuase it is easier to reach than the default and
" " it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w
" + <movement>
" " Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
"
"
" Useful settings
set history=700
set undolevels=700

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"
" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
set wrap linebreak nolist

" make .ipynb files highlighted with json syntaxis
filetype on
au BufNewFile,BufRead *.ipynb set filetype=json

" Set up searching so that it jumps to matches as the word is being entered and
" " is case-insensitive.
set incsearch
set ignorecase
set smartcase
set hlsearch

" Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Make ctlp plugin open new files in new tabs
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:Powerline_symbols = 'fancy'
"Show Powerline even when there is only one buffer
set laststatus=2
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 16
  elseif has("gui_photon")
    set guifont=Courier\ New:s16
  elseif has("gui_kde")
    set guifont=Courier\ New/16/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has('gui_macvim')
    set guifont=Monaco:h14     " OSX.
  else
    set guifont=Courier_New:h11:cDEFAULT
  endif
 endif

" Better copy & paste
" " When you want to paste large blocks of code into vim, press F2 before you
" " paste. At the bottom you should see ``-- INSERT (paste) --``.
"
set pastetoggle=<F2>
set clipboard=unnamed
"

" "
