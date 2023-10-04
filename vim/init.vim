"""""""""""""""""
"" Contents    "
"" ----------- "
"" 1. General  "
"" 2. Theme    "
"" 3. Plugins  "
""""""""""""""""

"" ---------------------------------------------------------------------------
"" 1. General
"" ---------------------------------------------------------------------------

syntax enable
syntax on

set encoding=utf-8 " set charset encoding
set number "show line numbers
set showcmd " show incomplete cmds down the bottom
set showmode " show current mode down the bottom
set autoread " reload files changed outside Vim
set list listchars=tab:\ \ ,trail:· " display tabs and trailing spaces visually
set nowrap " don't wrap lines
set linebreak " wrap lines at convenient points
set equalalways " split windows equally
set splitbelow " open horizontal split below the current one
set cul " highlight the cursor line
set shell=/bin/bash " load shell

"" Point out the location of Python binaries
let g:python_host_prog = "/Users/tiagoguedes/.pyenv/shims/python"
let g:python3_host_prog = "/Users/tiagoguedes/.pyenv/shims/python"
let g:python2_host_prog = "/usr/local/bin/python2"

"" Main key
let mapleader=","

"" Search
set hlsearch  " Highlight search matches
set incsearch " Search as you type
set smartcase " Use smartcase, when search query starts with Uppercase, turn off case insensitive search

"" Clipboard
set clipboard+=unnamedplus

"" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

"" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"" Indentation
set autoindent
set smartindent
set shiftround    " Round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, not 5)
set shiftwidth=2  " Auto-indent amount when using >> <<
set softtabstop=2 " When hitting tab or backspace, how many spaces should a tab be (see expandtab)

"" Tabulation
set smarttab
set tabstop=2
set expandtab " No real tabs!
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

"" Tabs
map <C-t> :tabnew<CR>
map <C-M-n> :tabedit %<CR>
noremap <leader>1 :tabn 1<CR>
noremap <leader>2 :tabn 2<CR>
noremap <leader>3 :tabn 3<CR>
noremap <leader>4 :tabn 4<CR>
noremap <leader>5 :tabn 5<CR>
noremap <leader>6 :tabn 6<CR>
noremap <leader>7 :tabn 7<CR>
noremap <leader>8 :tabn 8<CR>
noremap <leader>9 :tabn 9<CR>

"" Scrolling
set scrolloff=8 " Start scrolling when it's 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"" Viewport switching
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" Status bar
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %{fugitive#statusline()}
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

"" Tmux
let g:tmux_navigator_no_mappings = 1 " Tmux navigation keybinding
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

"" Splits

" Open vertical  split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" Open horizontal  split and switch to it
nnoremap <leader>h :split<CR>

"" Other

" Autoread files when changing buffers while inside Vim
au FocusGained,BufEnter * :checktime

" Save like a pro (CTRL+s)
nnoremap <c-s> :w<cr>

" Quit like a pro
nnoremap <C-M-q> :Kwbd<CR>
nnoremap <leader>q :q<CR>

" Upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Upper/lower first char of word
nmap <leader>wu mQgewvU`Q
nmap <leader>wl mQgewvu`Q

" This key combination gets rid of the search highlights
nmap <leader><space> :noh<cr>

" Enable upercase letter commands
cab Q! q!
cab Q q
cab W! w!
cab W w

"" ---------------------------------------------------------------------------
"" 2. Theme
"" ---------------------------------------------------------------------------

colorscheme OceanicNext

let g:airline_theme = 'oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has('termguicolors'))
 set termguicolors
endif

"" ---------------------------------------------------------------------------
"" 3. Plugins
"" ---------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
Plug 'roxma/vim-tmux-clipboard'           " Clipboard fix for tmux
Plug 'mhartington/oceanic-next'           " Color scheme
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy finder
Plug 'SirVer/ultisnips'                   " Fast snippet solution for Vim (requires Python)
Plug 'honza/vim-snippets'                 " Snippets for various programming languages
Plug 'brooth/far.vim'                     " Find and replace text through multiple files
Plug 'bling/vim-airline'                  " Bottom status bar + tabs
Plug 'nathanaelkane/vim-indent-guides'    " Visually displays indent levels in code
Plug 'rking/ag.vim'                       " Search for a pattern through multiple files (requires the_silver_searcher)
Plug 'scrooloose/nerdtree'                " File tree explored
Plug 'sjl/gundo.vim'                      " Keep tracking of all undos
Plug 'scrooloose/syntastic'               " Syntax analyzer
Plug 'airblade/vim-gitgutter'             " Mark lines that have been changed according to Git
Plug 'tpope/vim-fugitive'                 " Vim + Git
Plug 'tpope/vim-rhubarb'                  " Vim + GitHub
Plug 'tpope/vim-surround'                 " Edit what's surrounding a snippet of code
Plug 'tomtom/tcomment_vim'                " Comment code lika a boss
Plug 'tpope/vim-endwise'                  " Close 'if', 'def' etc
Plug 'christoomey/vim-tmux-navigator'     " Allows to consistenly navigates between Vim and Tmux split
Plug 'elixir-lang/vim-elixir'             " Syntax highlighting for Elixir
Plug 'rhysd/vim-crystal'                  " Syntax highlighting for Crystal
Plug 'jparise/vim-graphql'                " Syntax highlighting for GraphQL
Plug 'leafgarland/typescript-vim'         " Syntax highlighting for TypeScript
Plug 'prisma/vim-prisma'                  " Syntax highlighting for Prisma Schemas
Plug 'tmux-plugins/vim-tmux-focus-events' " Used for automatically refreshing code in the editor
Plug 'roxma/nvim-yarp'                    " Python framework ease writing Vim plugins
Plug 'psf/black'                          " Formatter – Python
Plug 'mhinz/vim-mix-format'               " Formatter – Elixir
Plug 'nvie/vim-flake8'                    " Linter – Python
Plug 'majutsushi/tagbar'                  " Overview of code structure for files
Plug 'tiagopog/gropen.vim'                " Open local files and directories on remote git repositories
Plug 'dense-analysis/ale'                 " Asynchronous lint engine for Vim (used here with LSP)
Plug 'vim-test/vim-test'                  " A Vim wrapper for running tests
call plug#end()

""
"" 3.1. File tree (nerdtree)
""

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_smart_startup_focus = 1

let NERDTreeIgnore = ['\.pyc$']

map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1

""
"" 3.2. Control of changes on files (gundo.vim)
""

nnoremap <F5> :GundoToggle<CR>

""
"" 3.3. Comments (tcomment_vim)
""

map <C-c> :TComment<CR>

""
"" 3.4. Search (ag.vim)
""

nnoremap <leader>a :Ag

""
"" 3.5. Completion (NCM2)
""

" Enable ncm2 for all buffers:
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect

" Suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
" set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
" inoremap <c-c> <ESC>

""
"" 3.6. CTags
""

nnoremap <silent> <Leader>b :TagbarToggle<CR>

""
"" 3.7.1. Linters - Regular Linters
""

" Python files (flake8):
let g:syntastic_python_checkers = ['flake8']
autocmd FileType python map <Leader>l :call flake8#Flake8()<CR>

" If you want to run the linter every time you save a Python file:
" autocmd BufWritePost *.py call flake8#Flake8()

""
"" 3.7.2. Linters - Language Server Protocol (LSP)
""

" General configuration
set completeopt=menu,menuone,preview,noselect,noinsert

" Ale (Asynchronous Lint Engine) general configuration
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {}
let g:ale_fixers = {}

""
" Elixir - ElixirLS
"
" References:
"
" - https://github.com/dense-analysis/ale
" - https://www.mitchellhanberg.com/post/2018/10/18/how-to-use-elixir-ls-with-vim/
" - https://dmerej.info/blog/post/lets-have-a-pint-of-vim-ale/

" Required, tell ALE where to find Elixir LS
let g:ale_elixir_elixir_ls_release = expand("/opt/homebrew/Cellar/elixir-ls/0.16.0/libexec/")

let g:ale_linters.elixir = ['credo', 'elixir-ls']

" Uncomment below line to disable Dialyzer checks:
" let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}

" Check details
autocmd FileType elixir,eelixir nnoremap <C-]> :ALEGoToDefinition<CR>
autocmd FileType elixir,eelixir nnoremap <C-\> :ALEFindReferences<CR>
autocmd FileType elixir,eelixir nnoremap <Leader>ed :ALEDetail<CR>

" Navigate the quickfix list
autocmd FileType elixir,eelixir nnoremap <Leader>ee :ALENext<CR>
autocmd FileType elixir,eelixir nnoremap <Leader>ew :ALEPrevious<CR>

""
" JavaScript/TypeScript - tsserver
"
" References:
"
" - https://blog.ffff.lt/posts/typescript-and-ale/

let g:ale_linters.typescript = ['eslint', 'tsserver']
let g:ale_linters.javascript = ['eslint']

let g:ale_fixers.typescript = ['prettier', 'eslint']
let g:ale_fixers.javascript = ['prettier', 'eslint']

" Check details
autocmd FileType javascript,typescript,typescriptreact nnoremap <C-]> :ALEGoToDefinition<CR>
autocmd FileType javascript,typescript,typescriptreact nnoremap <C-\> :ALEFindReferences<CR>
autocmd FileType javascript,typescript,typescriptreact nnoremap <Leader>ed :ALEDetail<CR>

" Navigate the quickfix list
autocmd FileType javascript,typescript,typescriptreact nnoremap <Leader>ee :ALENext<CR>
autocmd FileType javascript,typescript,typescriptreact nnoremap <Leader>ew :ALEPrevious<CR>

""
"" 3.8. Formatters
""

" Python (black):
" Dependency: pip install black
autocmd FileType python map <Leader>f :Black<CR>

" Elixir (mix format):
autocmd FileType elixir map <Leader>f :MixFormat<CR>

" SQL (sqlparse):
" Dependency: pip install sqlparse
function! SqlFormatter()
    set noai " skip no auto indentation
    :%!sqlformat --reindent --keywords upper --identifiers lower -
endfunction

autocmd FileType sql map <Leader>f call SqlFormatter()<CR>

" Prisma:
autocmd FileType prisma map <Leader>f :!npx prisma format<CR>

""
"" 3.9. Fuzzy Finders
""

""
" ctrlp:
"
" NOTE: use ctrlp with ag because it's so damn fast!
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" NOTE: if any file|directory needs to be ignored by ctrlp and it's using ag
" then .agignore at the user or project level should be edited. Otherwise
" uncomment the following line and add the direcories to be ignored:
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|.jest)|(\.(swp|ico|git|svn))$'

""
"" 3.10. Test Suites
""

""
" vim-test
" More: https://github.com/vim-test/vim-test#setup

" Keybidings for running tests
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

" Test runners
let g:test#python#runner = 'pytest'
let g:test#ruby#runner = 'rspec'
let g:test#elixir#runner = 'exunit'
let g:test#javascript#jest#executable = "yarn test"
let g:test#javascript#runner = 'jest'

" Additional config
let g:test#strategy = 'neovim'
let g:test#neovim#start_normal = 1
let g:test#basic#start_normal = 1
