" **********************************************************************
"" Plugins
" **********************************************************************

" Gotta be first
set nocompatible
set autoread

filetype off

" **********************************************************************
"" Plugins
" **********************************************************************

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" **********************************************************************
"" Plugins
" **********************************************************************

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'erichdongubler/vim-sublime-monokai'
Plugin 'chriskempson/base16-vim'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-commentary'
Plugin 'kana/vim-textobj-entire'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/CSApprox'
Plugin 'kchmck/vim-coffee-script'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'

" Highlight and strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'

" Easily surround chunks of text
Plugin 'tpope/vim-surround'

" Automaticall insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'

" Make tmux look like vim-airline (read README for extra instructions)
Plugin 'edkolev/tmuxline.vim'

" Syntax highlighting
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'cakebaker/scss-syntax.vim'"

" Disable arrow keys, hjkl keys, page up and down keys, among others
" To enabled it: call HardMode()
" To disabled it: call EasyMode()
Plugin 'wikitopian/hardmode'

Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" **********************************************************************
" Language specific plugins
" **********************************************************************

" ruby
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-projectionist'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'

" javascript
"" Javascript Bundle
Plugin 'jelera/vim-javascript-syntax'

" elixir
Plugin 'elixir-editors/vim-elixir'
Plugin 'carlosgaldino/elixir-snippets'

" **********************************************************************
" Basic configuration
" **********************************************************************

"" Use the clipboard as de default register
set clipboard^=unnamed,unnamedplus

"" Set tab width to 2 spaces and set autoidentation
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set autoindent

"" Treat numbers as decimal, not octal
set nrformats-=octal

"" Map leader character to
let mapleader=','

" **********************************************************************
" Mappings
" **********************************************************************

" Move lines up and down by one position. It also works with a visualy
" selected block of text
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Allows pressing j and k at the same time to go back to Normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Allow easy navigation between windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR>:<backspace>

call vundle#end()

filetype plugin indent on

set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set noswapfile
set relativenumber

syntax on

set mouse=a

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

runtime macros/matchit.vim
" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
colorscheme base16-default-dark
" colorscheme hybrid


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme='molokai'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
