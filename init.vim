if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


" ------------------------------
" General Config
" ------------------------------
let g:python3_host_prog = '/usr/local/bin/python3'

" Performance options
syntax on
set complete-=i
set lazyredraw
set nobackup
set nowritebackup
set noswapfile
set history=50
set timeoutlen=1000
set ttimeoutlen=0

" UI options
set backspace=2
set mouse=a
set laststatus=2
set nowritebackup
set noswapfile
set termguicolors
set number
set relativenumber
set ruler
set showcmd
set noshowmode
set hidden
set cursorline
set splitbelow
set splitright
set previewheight=1
set signcolumn=yes

" Search options
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Tab options
set noexpandtab
set smarttab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set shiftround

" Indent options
set autoindent
set copyindent
set smartindent

" Scroll options
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

" Wrap options
"set wrap
set linebreak
set breakindent
set breakindentopt=sbr
set showbreak=↪


" ------------------------------
" Plugins
" ------------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Autocomplete Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'

" Syntax Plugins
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ekalinin/Dockerfile.vim'

" Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

"Typescript Plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'rudism/deoplete-tsuquyomi'

" Theme Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'

" File Plugins
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'

" Misc Plugins
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'

call plug#end()


" ------------------------------
" Plugin Config
" ------------------------------

" Deoplete
set runtimepath+=~/.config/nvim/deoplete.nvim/
set completeopt=longest,menuone,preview,noinsert
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
call deoplete#custom#option('refresh_always', v:false)
autocmd InsertLeave * silent! pclose!

" Javascript
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]

" Typescript
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

" Nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
autocmd StdinReadPre * let s:std_in = 1

" Nerdcommenter
let g:NERDSpaceDelims = 2

" IndentLine
let g:indentLine_char = '│'
let g:indentLine_setColors = 0
let g:indentLine_concealcursor = ""
let g:vim_json_syntax_conceal = 0

" Syntax
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'underscore,jquery,react,backbone'

" CTRL P
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'


" ------------------------------
" Search Config
" ------------------------------

" Silver searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in ack
  let g:ackprg = 'ag --vimgrep'

  " Use ag in CtrlP for listing files. Lightning fast and respects
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Ack
cnoreabbrev Ack Ack!
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0


" ------------------------------
" Theme Config
" ------------------------------

" Colorscheme
"let ayucolor="dark"
"colorscheme ayu
"colorscheme neodark
colorscheme OceanicNext

" Airline
let g:airline_theme = "neodark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_highlighting_cache = 1


" ------------------------------
" Keyboard mapping
" ------------------------------

" Nerdtree toggle
function! IsNerdTreeEnabled()
   return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction
function! HasBuffer()
  return expand("%:t") != ''
endfunction
nnoremap <silent> <expr> <C-t> (IsNerdTreeEnabled()) ? ':NERDTreeToggle<CR>': (HasBuffer()) ? ':NERDTreeFind<CR>' : ':NERDTreeToggle<CR>'

" Auto complete
inoremap <silent> <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
inoremap <silent> <expr> <Esc> pumvisible() ? "<C-e>" : "<Esc>"
inoremap <expr> <Tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <C-Space> deoplete#refresh()

" Tsuquyomi navigation
nmap <C-]> <Plug>(TsuquyomiDefinition)
nmap <C-W>] <Plug>(TsuquyomiSplitDefinition)
nmap <C-W><C-]> <Plug>(TsuquyomiSplitDefinition)
nmap <C-^> <Plug>(TsuquyomiReferences)

" Split screen
nnoremap <silent> <C-\> :vs <CR>
inoremap <silent> <C-\> :vs <CR>
vnoremap <silent> <C-\> :vs <CR>

" Saving files
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-C>:update<CR>

" Buffer navigation
nnoremap <silent> <Leader>b :bp<CR>
nnoremap <silent> <Leader>f :bn<CR>
nnoremap <silent> <Leader>g :e#<CR>
nnoremap <silent> <Leader>q :bd<CR>

" Mode switch
nmap <Space> i
inoremap jj <Esc>
inoremap jk <Esc>

" Arrow keys are for noobs
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
