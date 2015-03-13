runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin on
syntax enable
colorscheme Tomorrow-Night-Bright

set relativenumber
set number
set ruler " show me where I am
" Toggle relative/absolute line number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

set autoread " reload files when changed on disk, i.e. via `git checkout`

" Tabs and indentation.
set autoindent
set expandtab " expand tabs to spaces
set shiftwidth=2 " normal mode indentation commands use 2 spaces
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set tabstop=2 " any actual tab characters occupy 2 spaces

" folding.
" set foldmethod=syntax
" set foldlevel=1

" show trailing whitespace
set list
set listchars=tab:▸\ ,trail:▫

" Line wrapping.
set nowrap
" If there is wrapping, use elipsis character.
set showbreak=…

" Searching.
set hlsearch
set incsearch
hi Search gui=none guibg=LightBlue guifg=Black
" Clear search highlights and status message.
nnoremap <silent> <Space> :nohlsearch<Bar> :echo<CR>

" Menu tab completion.
set wildmode:list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*

" Always show status bar.
set laststatus=2

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Transparency.
if has("gui_running")
  set transparency=10
endif

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

set ignorecase
" Overrides ignorecase if uppercase used in search string.
set smartcase

" greplace
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

let mapleader = ','

" toggle NERDTree
nmap <Leader>n :execute 'NERDTreeToggle "' . getcwd() . '"'<CR>
"reveal file in NERDTree
nmap <Leader>r :execute 'NERDTreeFind'<CR>
" open current dir in finder
nmap <Leader>o :execute '!open ' getcwd()<CR>

" move around splits more easily.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" replace trailing whitespace
nmap <Leader>w :execute '%s/\s\+$//'<CR>

" duplicate current line
nmap <Leader>d yyp
" duplicate selection
vmap <Leader>d yP

" disable auto indent.
nmap <Leader>i :setl noai nocin nosi inde=<CR>

" Command-T window height.
let g:CommandTMaxHeight=10

" Command-T with flush.
nmap <Leader>t :CommandT<CR>

" Ack plugin.
nmap <Leader>a :Ack! 

" Indentation.
vmap <D-]> >gv
vmap <D-[> <gv

" Switch to surrounding quotes.
nmap <Leader>" cs'"
nmap <Leader>' cs"'

" add end in erb.
nmap <Leader>e o<% end %><ESC>

" Tabular.
map <Leader>: :Tab /:\zs<CR> " by colon
map <Leader>= :Tab /=<CR>    " by equal
map <Leader>> :Tab /=><CR>   " by hash rocket
map <Leader>{ :Tab /{<CR>    " by curly brace
map <Leader><bar> :Tab /<bar><CR>    " by pipe (for markdown tables)

" restart passenger in current rails app.
nmap <Leader>R :!touch tmp/restart.txt<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" vim in irb.
if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" filetypes.
au BufNewFile,BufRead Guardfile  set filetype=ruby
au BufNewFile,BufRead Gemfile    set filetype=ruby
au BufNewFile,BufRead *.gemspec  set filetype=ruby
au BufNewFile,BufRead Skyfile    set filetype=ruby
au BufNewFile,BufRead *.master   set filetype=ruby
au BufRead,BufNewFile *.md       set filetype=markdown

" disable cursors
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

" Merginal
map <Leader>g :Merginal<CR>

" Aliases for fugitive
command Gci Gcommit
