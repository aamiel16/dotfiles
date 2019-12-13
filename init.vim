" //
" // ─── VIM PLUG ───────────────────────────────────────────────────────────────────
" //

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" //
" // ─── GENERAL CONFIG ─────────────────────────────────────────────────────────────
" //

" Performance options
syntax on
let mapleader=" "
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
set number
set relativenumber
set ruler
set hidden
set splitbelow
set splitright
set previewheight=1
set signcolumn=yes
set nowrap

" Search options
set ignorecase
set smartcase
set incsearch

" Tab options
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set shiftround

" Indent options
set autoindent
set copyindent
set smartindent

" Scroll options
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

" Completion options
filetype plugin on
set completeopt-=preview
set shortmess+=c
set updatetime=300

set wildignore+=*/.git/*                                    " ctrlp - ignore files in git directories
set wildignore+=*/tags/*                                    " ctrlp - ignore files in tag directories
set wildignore+=*/tmp/*                                     " ctrlp - ignore files in tmp directories
set wildignore+=*/target/*                                  " ctrlp - ignore files in target directories
set wildignore+=*/build/*                                   " ctrlp - ignore gradle build directories
set wildignore+=*.d.ts                                      " ctrlp - ignore type defn files
set wildignore+=*.so                                        " ctrlp - ignore .so files
set wildignore+=*.o                                         " ctrlp - ignore .o files
set wildignore+=*.class                                     " ctrlp - ignore .class files
set wildignore+=*.swp                                       " ctrlp - ignore .swp files
set wildignore+=*.zip                                       " ctrlp - ignore .zip files
set wildignore+=*.pdf                                       " ctrlp - ignore .pdf files
set wildignore+=*package-lock.json                          " ctrlp - ignore package-lock files
set wildignore+=*/node_modules/*                            " ctrlp - ignore node modules
set wildignore+=*/bower_components/*                        " ctrlp - ignore bower components
set wildignore+=*/dist/*                                    " ctrlp - ignore grunt build directory
set clipboard=unnamedplus                                   " use system clipboard
set shell=/bin/zsh                                          " use zsh

" //
" // ─── PLUGINS ────────────────────────────────────────────────────────────────────
" //

call plug#begin('~/.local/share/nvim/plugged')

" Autocomplete Plugins
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntax Plugins
Plug 'w0rp/ale'
Plug 'isRuslan/vim-es6'
Plug 'elzr/vim-json'
Plug 'ekalinin/Dockerfile.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'chr4/nginx.vim'
Plug 'jiangmiao/auto-pairs'

" Theme Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" File Plugins
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'

" Misc Plugins
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'Valloric/ListToggle'

" Temp
Plug 'edkolev/tmuxline.vim'

call plug#end()

" //
" // ─── NERDTREE ────────────────────────────────────────────────────────────────────────
" //

let g:NERDTreeWinSize = 30
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1

" Nerdtree toggle
let g:isNerdtreeOpen = 0
function! NerdTreeToggle()
  if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    if winbufnr(2) == -1
      exec 'bd'
    else
      silent NERDTreeClose
    endif
    let g:isNerdtreeOpen = 0
  else
    if expand("%:t") != ''
      silent NERDTreeFind
    else
      silent NERDTree
    endif
    let g:isNerdtreeOpen = 1
  endif
endfunction


" //
" // ─── NERDCOMMENTER ───────────────────────────────────────────────────────────────────
" //

let g:NERDSpaceDelims = 2

" //
" // ─── INDENTLINE ──────────────────────────────────────────────────────────────────────
" //

let g:indentLine_char = '│'
let g:indentLine_concealcursor = ''
let g:vim_json_syntax_conceal = 0

" //
" // ─── ALE ─────────────────────────────────────────────────────────────────────────────
" //

let g:ale_set_highlights = 0
let g:ale_lint_delay = 500
let g:ale_cache_executable_check_failures = 1
let g:ale_virtualenv_dir_names = []


" //
" // ─── EMMET ───────────────────────────────────────────────────────────────────────────
" //

let g:user_emmet_mode = 'i'
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_install_global = 0

" //
" // ─── COC ─────────────────────────────────────────────────────────────────────────────
" //

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier', 
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ ]

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" COC show documentation
function! s:ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" //
" // ─── CTRLP ───────────────────────────────────────────────────────────────────────────
" //

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|d\.ts))$'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1

" //
" // ─── FUGITIVE ────────────────────────────────────────────────────────────────────────
" //

set diffopt+=vertical

" //
" // ─── ACK & AG ────────────────────────────────────────────────────────────────────────
" //

cnoreabbrev Ack Ack!
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0

" Silver searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
  let g:ackprg = 'ag --vimgrep' " Use ag in ack
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " Use ag in CtrlP for listing files. Lightning fast and respects
  let g:ctrlp_use_caching = 0 " ag is fast enough that CtrlP doesn't need to cache
endif

" //
" // ─── COMMENT HEADER ──────────────────────────────────────────────────────────────────
" //

function! CommentHeader(text)
  let a:div = '─'
  let a:comment = '//'
  let a:space = a:text != '' ? ' ' : ''
  let a:pre = repeat(a:div, 3) . a:space .  trim(toupper(a:text)) . a:space
  let a:post = repeat(a:div, 91 - strlen(a:pre)) 

  :put! = '//'
  :put! = '// ' . a:pre . a:post
  :put! = '//'
endfunction

" //
" // ─── THEME ───────────────────────────────────────────────────────────────────────────
" //

colorscheme solarized
if match(execute("silent !theme-profile"), "light") > 0
  set background=light
else
  set background=dark
endif

" Airline
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
let g:airline_extensions = [ 'ctrlp', 'branch', 'tabline' ]
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Solarized theme switch
function! SolarSwap()
  let l:profile=execute("silent !theme-profile")
  if match(l:profile, "light") > 0
    set background=dark
  else
    set background=light
  endif
  execute("silent !theme-toggle")
endfunction

command! ThemeToggle call SolarSwap()

" //
" // ─── MAXIMIZE WINDOW ─────────────────────────────────────────────────────────────────
" //

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" //
" // ─── AUTO COMMANDS ───────────────────────────────────────────────────────────────────
" //

augroup mAutocmds
  au!

  au FileType javascript set suffixesadd+=.js,.jsx
  au FileType typescript set suffixesadd+=.ts,.tsx

  au InsertLeave * if pumvisible() == 0|pclose|endif
  au CursorMovedI * if pumvisible() == 0|pclose|endif
  au StdinReadPre * let s:std_in = 1 " Nerdtree
  au FileType * let g:AutoPairs["<"] = ">" " Autopairs
  au FileType qf setlocal wrap " Ale error
  au FileType html,css,typescript,javascript,typescript.tsx,javascript.tsx EmmetInstall " Emmet
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp') " Update signature help on jump placeholder 
augroup END

" //
" // ─── KEYBOARD MAPPING ───────────────────────────────────────────────────────────
" //

" Nerdtree toggle
nnoremap <silent> <C-t> :call NerdTreeToggle()<CR>

" Comment header
nnoremap <silent> <Leader>y "0dd:call CommentHeader('<C-r>0')<CR>

" Prettier
nnoremap <silent> <Leader>r :Prettier<CR>

" CtrlP
nnoremap <silent> <C-b> :CtrlPBuffer<CR>

" Ale error navigation
nmap <silent> <Leader>a <Plug>(ale_previous_wrap)
nmap <silent> <Leader>s <Plug>(ale_next_wrap)

" Auto complete
inoremap <silent><expr> <CR> pumvisible() ? "\<C-Y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <Esc> pumvisible() ? "<C-E>" : "<Esc>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-N>" : "\<tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-tab>"
inoremap <silent><expr> <C-Space> coc#refresh()

" Coc
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>

" Commenter
nmap <silent> <Leader>/ <plug>NERDCommenterToggle
vmap <silent> <Leader>/ <plug>NERDCommenterToggle

" Buffer manipulation
noremap <silent> <C-Q> :bd<CR>
noremap <silent> <C-W>q :bd<CR>
noremap <silent> <C-W>qq :bd!<CR>
noremap <silent> <C-W>\ :vs <CR><C-W>h
noremap <silent> <C-W>- :sp <CR><C-W>k
nnoremap <C-W>o :call MaximizeToggle()<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer navigation
let c = 1
while c <= 99
  execute "nnoremap <silent> <Leader>" . c . " :" . c . "b\<CR>"
  let c += 1
endwhile
nnoremap <silent> <Leader>[ :bp<CR>
nnoremap <silent> <Leader>] :bn<CR>
nnoremap <silent> <Leader>g :e#<CR>

" Tab navigation
noremap <silent> <C-T>q :tabclose<CR>
noremap <silent> <Leader>{ :tabp<CR>
noremap <silent> <Leader>} :tabn<CR>

" Saving files
nnoremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-C>:update<CR>

" Global search
nnoremap <Leader>f :Ack! -S -Q ""<Left>

" Copy / Paste from clipboard
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>p "+p

" Wrapped lines goes down/up to next row
nnoremap j gj
nnoremap k gk

" Yank till end of line
noremap <silent> Y y$

" Mode switch
imap jj <Esc>
imap jk <Esc>

" Remove highlight on escape
nnoremap <silent> <ESC> :nohl<CR><ESC>

" NOOPS / Arrow keys?
map <C-w><C-q> <Nop>
map Q <Nop>
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
