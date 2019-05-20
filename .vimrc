"===== BEGIN VUNDLE BOILERPLATE =====
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'uarun/vim-protobuf'
Plugin 'rust-lang/rust.vim'
Plugin 'sirtaj/vim-openscad'
Plugin 'ervandew/supertab'
Plugin 'google/vim-searchindex'
Plugin 'mhinz/vim-signify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"===== END VUNDLE BOILERPLATE =====


"enable syntax highlighting:
syntax on

"set tab to be 4 spaces
set tabstop=4
set expandtab
set shiftwidth=4
set cino=(1s "add one indent after an open parenthesis newline

"enable autoindentation
set autoindent

"highlight matching parenthesis
hi MatchParen cterm=none ctermbg=green ctermfg=blue

"enable mouse scrolling and set scroll to 1 line
set mouse=a

"80 char ruler:
set colorcolumn=81
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

"hack to fix line length in rust files.
au BufRead,BufNewFile *.rs setlocal textwidth=80

"show filename at bottom:
set statusline=%f
set laststatus=2
let g:airline_theme='solarized'
let g:airline_detect_whitespace=0

"show line numbers:
set number

"highlight search results:
set hlsearch

"show whitespace
set list
set listchars=tab:>·,nbsp:·,trail:·

"set colorscheme:
let g:solarized_termcolors=256
set t_Co=256
set background=light
colorscheme solarized

"enable english spell-checking
set spell spelllang=en_us

"highlight current line of the cursor:
set cursorline

"automatically reload a file if it's in a second window:
set autoread

"have text wrap full words
set linebreak
set tw=79

"have arrow keys move through lines visually
noremap j gj
noremap k gk
nmap <up> gk
nmap <down> gj

"set specific syntax highlighting for certain file extensions
autocmd BufNewFile,BufRead *.md set syntax=markdown
autocmd BufNewFile,BufRead *BUILD set syntax=python

"makes capital W also save the file:
:command WQ wq
:command Wq wq
:command W w
:command Q q

"indentation for Haskell:
autocmd Filetype haskell setlocal ts=2 sw=2

"indentation for C++:
autocmd Filetype cpp setlocal ts=2 et sw=2

"indentation for Python:
autocmd Filetype python setlocal ts=4 et sw=4 sts=4

"make tab complete for filenames more like bash:
set wildmode=longest,list

"set jj to be escape
inoremap jj <Esc>

"Add some emacs keybindings
noremap <C-c> <Esc>
inoremap <C-c> <Esc>
noremap <C-e> $
inoremap <C-e> <Esc>A
noremap <C-a> ^
inoremap <C-a> <Esc>I

"disable the page up and page down keys
map <PageUp> <nop>
imap <PageUp> <nop>
map <PageDown> <nop>
imap <PageDown> <nop>

"make return in supertab not make a new line:
let g:SuperTabCrMapping = 1

"set tagbar to enable with F8:
nmap <F8> :TagbarToggle<CR>

"fix problem with backspace in insert mode:
set backspace=indent,eol,start

"set F5 to strip trailing whitespace (see: https://vi.stackexchange.com/a/2285)
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"disable middle-click paste:
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

"for rust ctags:
 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

"disable header search
set complete-=i

"don't indent namespaces!
set cino=N-s

"fix delete in iterm2 by mapping C-l to DEL
inoremap <C-l> <Del>

"disable the bell
set belloff=all

"fix spell check in solarized light colorscheme
hi SpellBad term=underline cterm=underline gui=undercurl guisp=Red

"set the VCSs to check with signify:
let g:signify_vcs_list = ['perforce', 'git']

"set signify's colors
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
highlight SignifySignAdd cterm=bold ctermbg=22 ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=1 ctermfg=217
highlight SignifySignChange cterm=bold ctermbg=208 ctermfg=229
