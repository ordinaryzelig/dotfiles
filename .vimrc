runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin on
syntax enable
colorscheme base16-default-dark

set relativenumber
set number
set ruler

set autoread " reload files when changed on disk, i.e. via `git checkout`

" Tabs and indentation.
set autoindent
set expandtab " expand tabs to spaces
set shiftwidth=2 " normal mode indentation commands use 2 spaces
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set tabstop=2 " any actual tab characters occupy 2 spaces
filetype plugin indent on

" vim-textobj-rubyblock said so.
set nocompatible

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
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,tmp/*,*/node_modules/*

" Always show status bar.
set laststatus=2

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Transparency.
if has("gui_running")
  set transparency=10
endif

set noswapfile

set ignorecase
" Overrides ignorecase if uppercase used in search string.
set smartcase

" greplace
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

let mapleader = ','

" Toggle vertical cursor highlight
function! CursorcolumnToggle()
  if(&cursorcolumn == 1)
    set nocursorcolumn
  else
    set cursorcolumn
  endif
endfunc
nnoremap <Leader>v :call CursorcolumnToggle()<cr>

" toggle NERDTree
nmap <Leader>n :execute 'NERDTreeToggle "' . getcwd() . '"'<CR>
"reveal file in NERDTree
nmap <Leader>r :execute 'NERDTreeFind'<CR>
" open current dir in finder
nmap <Leader>o :execute '!open ' getcwd()<CR>
let NERDTreeIgnore = ['node_modules']

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

" Ack plugin.
nmap <Leader>a :Ack! 
nmap <Leader>A viwy:Ack! "\b<C-r>"\b"

" Indentation.
vmap <D-]> >gv
vmap <D-[> <gv

" Switch to surrounding quotes.
nmap <Leader>" cs'"
nmap <Leader>' cs"'

" add end in erb.
nmap <Leader>e o<% end %><ESC>

" vim-easy-align.
vmap <Leader>: :EasyAlign1:<CR>| " by colon
vmap <Leader>= :EasyAlign=<CR>|  " by equal
vmap <Leader>> :EasyAlign=><CR>| " by hash rocket
vmap <Leader>{ :EasyAlign{<CR>|  " by open curly brace

" filetypes.
au BufNewFile,BufRead Guardfile   set filetype=ruby
au BufNewFile,BufRead Gemfile     set filetype=ruby
au BufNewFile,BufRead *.gemspec   set filetype=ruby
au BufNewFile,BufRead Skyfile     set filetype=ruby
au BufNewFile,BufRead *.master    set filetype=ruby
au BufRead,BufNewFile *.md        set filetype=markdown
au BufRead,BufNewFile *.yml.enc.* set filetype=yaml

" disable cursors
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

" map jk as escape.
:inoremap jk <esc>

" Aliases for fugitive
command Gci Gcommit

" Remap to madfije tag navigation easier.
nmap <C-[> :pop<CR>

" Substitute shorcuts.
" sub word under cursor.
nmap <Leader>s :s/<C-r><C-w>/
" sub word under cursor (%).
nmap <Leader>S :%s/<C-r><C-w>/

" tap(&method(:ap))
nmap <Leader>p a.tap(&method(:ap))<ESC>
nmap <Leader>P A.tap(&method(:ap))<ESC>

let g:ctrlp_custom_ignore = 'tmp/cache'
