
" vim-plug configuration
call plug#begin('~/.local/share/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'flazz/vim-colorschemes'


Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Improves directory management in vim
Plug 'tpope/vim-vinegar'

" shows character motions
Plug 'unblevable/quick-scope'

Plug 'sjl/splice.vim'

Plug 'mesonbuild/meson'
Plug 'stfl/meson.vim'


" " Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" " Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" " Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }
"
" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" " Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
"
" " Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme jellybeans

set splitbelow      " On split, the new window will be below.
set splitright      " On vsplit, the new window will be on the right

set confirm         " ask for confirmation on some actions

" Tabs parameters
set smarttab
set expandtab
set softtabstop=4
set shiftwidth=4    " width of the shift command (for indentation)
"set tabstop=4      " should not be used. See :help tabstop for wayaround

set number
set cursorline
set scrolloff=2     " Mininal amount of lines to keep between cursor and top and bottom of screen

" Text formating
"set columns=84      "Big trick: this is the size of the window
set nowrap
set wrapmargin=79
set textwidth=79    " maximum width of text that is being inserted (brokes after a whitespace)(0 to disable)

" Search
set hlsearch        " hightlight matching result after a search (nohl to desactivate)
set smartcase       " used when searching a pattern with upper case and override ignorecase
set incsearch       " show results while you haven't finished to type the pattern yet
set nogdefault      " does not us g flag when doing a :s/// substitute.

" Bottom menu
set showcmd         " show partial command at the bottom of the screen
set ruler           " show the line and column of the cursor position

" Performances
set synmaxcol=500   " beyond this column, syntax hl is disabled
set ttyfast         " fast terminal connection; improves smoothness when multiple windows opened
set hidden          " do not unload a buffer when abandoning it
set lazyredraw      " do not redraw while execution of cmds is not finished

set foldmethod=syntax   " use the syntax file to hide bunches of code
set nomodeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "`"

" Essential map
inoremap jk <esc>
inoremap JK <esc>
nnoremap ; :

" for long wrapping lines
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $

" Change buffer
noremap <C-N> :bn<CR>
noremap <C-P> :bp<CR>

" switch buffers more naturally
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" To comment
nnoremap <F5> gI//<Space><Esc>j^
" To uncomment
nnoremap <F6> gI<esc>3xj

" Hide coloration of found words
"nnoremap -- :nohlsearch<CR>

" Easy Aligh plugin mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
vnoremap // y/\V<C-R>"<CR>


" FZF plugin mappings

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nmap <leader>o :Files<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
