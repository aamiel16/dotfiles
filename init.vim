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
set nowrap

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
set linebreak
set breakindent
set breakindentopt=sbr
set showbreak=↪


" //
" // ─── PLUGINS ────────────────────────────────────────────────────────────────────
" //

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
Plug 'ludovicchabant/vim-gutentags'

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
Plug 'chrisbra/Colorizer'
Plug 'mattn/emmet-vim'

call plug#end()


" //
" // ─── PLUGINS CONFIG ─────────────────────────────────────────────────────────────
" //

" Deoplete
autocmd InsertLeave * silent! pclose!
set runtimepath+=~/.config/nvim/deoplete.nvim/
set completeopt=longest,menuone,preview,noinsert
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\ 'refresh_always': v:false,
\ 'auto_complete': v:false
\ })

" Javascript
autocmd BufEnter *.jsx set filetype=javascript
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]

" Typescript
autocmd BufEnter *.tsx set filetype=typescript
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_javascript_support = 1

" Nerdtree
autocmd StdinReadPre * let s:std_in = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

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

" Ale
let g:ale_set_highlights = 0

" Colorizer
let g:colorizer_auto_color = 0
let g:colorizer_colornames = 0
"let g:colorizer_colornames_disable = 1
let g:colorizer_skip_comments = 1
let g:colorizer_auto_filetype='css,html,typescript,javascript'

" Emmet
autocmd FileType html,css,typescript,javascript EmmetInstall
let g:user_emmet_mode='i'
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_install_global = 0

" CTRL P
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|d\.ts))$'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100
let g:ctrlp_working_path_mode = 0

" Gutentags
function! GutentagsEnableFn(path) abort
    return fnamemodify(a:path, ':e') != 'typescript'
endfunction
let g:gutentags_enabled_user_func = 'GutentagsEnableFn'

" Fugitive
set diffopt+=vertical

" Ack
cnoreabbrev Ack Ack!
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0

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

" Autoread on file change
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"  //
"  // ─── THEME CONFIG ───────────────────────────────────────────────────────────────
"  //

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

" True colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" //
" // ─── FUNCTIONS ──────────────────────────────────────────────────────────────────
" //

" Nerdtree toggle
function! IsNerdTreeEnabled()
   return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction
function! HasBuffer()
  return expand("%:t") != ''
endfunction

" Comment header
function CommentHeader(text)
  let a:div = '─'
  let a:comment = '//'
  let a:space = a:text != '' ? ' ' : ''
  let a:pre = repeat(a:div, 3) . a:space .  toupper(a:text) . a:space
  let a:post = repeat(a:div, 91 - strlen(a:pre)) 

  :put! = '//'
  :put! = '// ' . a:pre . a:post
  :put! = '//'
endfunction

" Terminal
let s:monkey_terminal_window = -1
let s:monkey_terminal_buffer = -1
let s:monkey_terminal_job_id = -1

function! MonkeyTerminalOpen(height)
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:monkey_terminal_buffer)
    " Creates a window call monkey_terminal
    new monkey_terminal
    " Moves to the window the right the current one
    wincmd J
    exec "resize " . a:height
    let s:monkey_terminal_job_id = termopen($SHELL, { 'detach': 1 })

    " Change the name of the buffer to "Terminal 1"
    silent file Terminal\ 1
    " Gets the id of the terminal window
    let s:monkey_terminal_window = win_getid()
    let s:monkey_terminal_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
  else
    if !win_gotoid(s:monkey_terminal_window)
      sp
      " Moves to the window below the current one
      wincmd J
      exec "resize " . a:height
      buffer Terminal\ 1
      " Gets the id of the terminal window
      let s:monkey_terminal_window = win_getid()
    endif
  endif
endfunction

function! MonkeyTerminalClose()
  if win_gotoid(s:monkey_terminal_window)
    " close the current window
    hide
  endif
endfunction

function! MonkeyTerminalToggle(height)
  if win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalClose()
  else
    call MonkeyTerminalOpen(a:height)
  endif
endfunction

" Maximizing a split window
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

" Quickfix toggle
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction


" //
" // ─── KEYBOARD MAPPING ───────────────────────────────────────────────────────────
" //

" Nerdtree toggle
nnoremap <silent> <expr> <C-t> (IsNerdTreeEnabled()) ? ':NERDTreeToggle<CR>': (HasBuffer()) ? ':NERDTreeFind<CR>' : ':NERDTreeToggle<CR>'

" Comment header
nnoremap <silent> <Leader>y "0dd:call CommentHeader('<C-r>0')<CR>

" Terminal
nnoremap <silent> <Leader>` :call MonkeyTerminalToggle(9)<cr>
tnoremap <silent> <Leader>` <C-\><C-n>:call MonkeyTerminalToggle(9)<cr>

" Quickfix toggle
nnoremap <silent> <C-q> :call QuickfixToggle()<cr>

" Auto complete
inoremap <silent> <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
inoremap <silent> <expr> <Esc> pumvisible() ? "<C-e>" : "<Esc>"
inoremap <expr> <Tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<c-p>" : "\<tab>"
inoremap <silent> <expr> <C-Space> deoplete#mappings#manual_complete()

" Tsuquyomi navigation
autocmd FileType typescript nmap <silent> <C-]> <Plug>(TsuquyomiDefinition)
autocmd FileType typescript nmap <silent> <C-W>] <Plug>(TsuquyomiSplitDefinition)
autocmd FileType typescript nmap <silent> <C-W><C-]> <Plug>(TsuquyomiSplitDefinition)
autocmd FileType typescript nmap <silent> <C-^> <Plug>(TsuquyomiReferences)

" Split screen
nnoremap <silent> <C-\> :vs <CR>
inoremap <silent> <C-\> :vs <CR>
vnoremap <silent> <C-\> :vs <CR>
nnoremap <silent> <C-W>O :call MaximizeToggle()<CR>
nnoremap <silent> <C-W>o :call MaximizeToggle()<CR>
nnoremap <silent> <C-W><C-O> :call MaximizeToggle()<CR>

" Saving files
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-C>:update<CR>

" Global search
nnoremap <Leader>f :Ack --smart-case<Space>

" Copy / Paste from clipboard
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>p "+p

" Buffer navigation
let c = 1
while c <= 99
  execute "nnoremap <silent> <Leader>" . c . " :" . c . "b\<CR>"
  let c += 1
endwhile
nnoremap <silent> <Leader>[ :bp<CR>
nnoremap <silent> <Leader>] :bn<CR>
nnoremap <silent> <Leader>g :e#<CR>
nnoremap <silent> <Leader>q :bd<CR>
nnoremap <silent> <Leader>qq :bd!<CR>

" Mode switch
nmap <Space> i
inoremap jj <Esc>
inoremap jk <Esc>

" Resize
nnoremap <silent> <Left> :vertical resize -2<CR>
nnoremap <silent> <Right> :vertical resize +2<CR>
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>

" Arrow keys are for noobs
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
