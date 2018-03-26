set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

"Plug 'crusoexia/vim-monokai'
Plug 'mhartington/oceanic-next'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'yssl/QFEnter'
Plug 'milkypostman/vim-togglelist'
Plug 'yuttie/comfortable-motion.vim'
"Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
"Plug 'roxma/nvim-completion-manager'
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'ternjs/tern_for_vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet'
Plug 'wokalski/autocomplete-flow'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'KeitaNakamura/neodark.vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""
""" COMMON SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

set mouse=a
set termguicolors
set number
set relativenumber

set hidden " Allow buffers to be hidden after editing
set completeopt=longest,menuone

set nohlsearch									" no highlight search
set ignorecase 									" ignore case when searching
set smartcase 									" when searching try to be smart about cases 
set incsearch 									" makes search act like search in modern browser

set noexpandtab
set smarttab										" insert tabs on start of line base on shiftwidth not tabstop
set tabstop=2										" tab space size
set softtabstop=0								" delete space not tabs
set shiftwidth=2								" number of spaces for auto indenting
set shiftround									" use multple shiftwidth when indenting with > and <

set autoindent
set copyindent
set smartindent

set scrolloff=3
set sidescrolloff=5
set sidescroll=1
set cursorline

set splitbelow
set splitright

"set list
"set listchars=tab: ,trail:~

set wildignore+=*/node_modules/*


"""""""""""""""""""""""""""""""""""""""""""""""""
""" THEME SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
let g:neodark#background='#202020'
colorscheme neodark
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colorscheme OceanicNext

let g:airline_theme="neodark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_highlighting_cache = 1

let g:indentLine_char = '┊'
let g:indentLine_setColors = 0
let g:vim_json_syntax_conceal = 0

highlight link xmlEndTag xmlTag
highlight MatchParen cterm=bold ctermbg=none guibg=none guifg=208 ctermfg=208
highlight Search ctermbg=245
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight Error None
highlight NonText ctermfg=7 guifg=gray


"""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDTREE SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
autocmd StdinReadPre * let s:std_in=1


"""""""""""""""""""""""""""""""""""""""""""""""""
""" EMMET SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'javascript.js': {
\      'extends' : 'jsx'
\  }
\}


"""""""""""""""""""""""""""""""""""""""""""""""""
""" SYNTAX SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'underscore,jquery,react,backbone'
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_flow = 1
"let g:mta_filetypes = {
"    \ 'html' : 1,
"    \ 'xhtml' : 1,
"    \ 'xml' : 1,
"    \ 'jinja' : 1,
"    \ 'javascript.jsx': 1
"    \}


"""""""""""""""""""""""""""""""""""""""""""""""""
""" COMMENTER SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 2


"""""""""""""""""""""""""""""""""""""""""""""""""
""" TOGGLE LIST SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:toggle_list_no_mappings = 1


"""""""""""""""""""""""""""""""""""""""""""""""""
""" SILVER SEARCHER SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""
""" ACK SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev Ack Ack!
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0


"""""""""""""""""""""""""""""""""""""""""""""""""
""" AUTO COMPLETE SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#timeout = 100000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


"""""""""""""""""""""""""""""""""""""""""""""""""
""" OMNI SEARCH SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
augroup omnicomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""
""" GOTO SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
augroup suffixes
    autocmd!
    let associations = [["javascript", ".js,.javascript,.es,.esx,.json"], ["python", ".py,.pyw"]]
    for ft in associations
        execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
    endfor
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""
""" KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
" USED MAPPINGS:
" F2
" F3
"
" C-t
" C-j
" C-k
" C-s
" C-q
" C-Space
"
" Leader-e
" Leader-n
" Leader-x
" Leader-y
" Leader-p
" Leader-l
" Leader-b
" Leader-f
" Leader-g
" Leader-q
" Leader-`
" Leader-r
" Leader-\
" Leader-[1-99]
"
" jj
" jk
" gf

" Insert mode key map
nmap <Space> i

" Normal mode key map
inoremap jj <Esc>
inoremap jk <Esc>


" split screen
nnoremap <silent><c-\> :vs <CR>
inoremap <silent><c-\> :vs <CR>
vnoremap <silent><C-\> :vs <CR>

" Goto definition
nnoremap <silent>gf :TernDef <CR>

" Auto completion
inoremap <silent><expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e>" : "<Esc>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr><C-Space> deoplete#refresh()

" Nerd tree toggle
function! IsNerdTreeEnabled()
   return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction
function! HasBuffer()
  return expand("%:t") != ''
endfunction
nnoremap <silent> <expr> <C-t> (IsNerdTreeEnabled()) ? ':NERDTreeToggle<CR>': (HasBuffer()) ? ':NERDTreeFind<CR>' : ':NERDTreeToggle<CR>'


" Quiting and Saving files
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-C>:update<CR>


" Create new file in the same folder where current edited file is located
nnoremap <Leader>n :wincmd w<CR>ma


" Copy and paste to or from system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>x "+d
vnoremap <Leader>p "+pa
set pastetoggle=<Leader>[

" Emmet expand
imap <C-e> <plug>(emmet-expand-abbr)


" F2 for global search and F3 to search on word 
nnoremap <F2> :Ack! --smart-case <Space>
nnoremap <F3> :Ack! --smart-case <C-R><C-W><CR>
noremap <F4> :set hlsearch! hlsearch?<CR>

" Find and replace if file
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Move a line of text using Ctrl+[jk]
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" Mappings to access buffers
nnoremap <silent> <Leader>b :bp<CR>
nnoremap <silent> <Leader>f :bn<CR>
nnoremap <silent> <Leader>g :e#<CR>
nnoremap <silent> <C-Q> :bd<CR>
nnoremap <silent> <C-Q>q :bd!<CR>
nnoremap <silent> <Leader>q :bd<CR>

" \x would access the buffer from 1-99
let c = 1
while c <= 99
   execute "nnoremap <Leader>" . c . " :" . c . "b\<CR>"
   let c += 1
endwhile


" Mapping quick fix and location list
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>` :call ToggleQuickfixList()<CR>

" Mapping QFEnter keymaps
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']
