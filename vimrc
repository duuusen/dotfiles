if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

"let mapleader=","
syntax enable " There's a difference between 'enable' and 'on'
colorscheme gruvbox
set encoding=utf-8 "Dear lord, that fixed so many issues
set ttimeoutlen=50 "Prevents delay when swtiching modes
set autoindent
set backspace=2 "Backspace deletes normally in insert mode
set showcmd
set visualbell
set wildmenu
set wildmode=list:longest,full
set laststatus=2 "Always display statusbar // Do I need this??
set ttyfast "Allow Mouse
set mouse=a
set clipboard=unnamed "unnamed = system clipboard

" Autowrite
set autowrite "Automatically :write before running commands
set autoread "Reloads files changed outside of vim

" No backup
set nobackup
set nowritebackup
set noswapfile

" Softtabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" General remap
" Enter makes new line without entering insert mode
nnoremap <CR> o<Esc>
inoremap jj <Esc>
nnoremap <Leader>r :reg<CR>
nnoremap <silent><Leader>m :make<CR>
"inoremap { {}<Left><CR><CR><Up><Tab> 
inoremap () ()<Left>
inoremap (; ();<Left><Left>
" Edit and reload vimrc
nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>rv :so $MYVIMRC<CR>
nnoremap <Leader>ep :vsp ~/.vimrc.plugins<CR>
nnoremap ; :
" Reload every open buffer
nnoremap <Leader>rb :bufdo e<CR>

" Search
set gdefault
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
nnoremap <silent><Space> :noh<Bar>:echo<CR>

" System clipboard
"set pastetoggle=<F2>
"map <silent><Leader>p :set paste<CR>o<Esc>"*]p:set nopaste<cr>"
"map <silent><Leader><S-p> :set paste<CR>O<Esc>"*]p:set nopaste<cr>"
"Ctrl+c in visual mode sends selection to clipboard
vnoremap <C-c> "*y

" Textwrapping
"set textwidth=80
"set formatoptions=qrn
"set colorcolumn=85

" Scrolling
set scrolloff=5 "Starts scrolling 5 lines before end of screen
set sidescrolloff=10
set sidescroll=1
" C-e/C-d to scroll
nnoremap <C-e> <C-y>
nnoremap <C-d> <C-e>

" Navigation // tmux-line-navigator Plugin seems to take care of this
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" Numbering // jeffkreeftmeijer.com/vim-number/
set number relativenumber
augroup numberToggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
 autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Cursorline
augroup cursorLine
  autocmd!
  autocmd VimEnter * setlocal cursorline "When vim starts up
  autocmd WinEnter * setlocal cursorline
  autocmd BufWinEnter * setlocal cursorline "When buffer is loaded
  autocmd WinLeave * setlocal nocursorline
augroup END

" Splits
set splitright
set splitbelow

" opening and closing splits
nnoremap <Leader>s <C-w>v
nnoremap <Leader>q <C-w>q

" Tab instead % to jump between blocks
nnoremap <tab> %
vnoremap <tab> %

" Jump to last known cursor position, except commit messages (thoughtbot)
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Quicksave/quit
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :q<CR>

" Max out the height of the current split
"ctrl + w _
" Max out the width of the current split
"ctrl + w |
" Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =

" ====== Airline
let g:airline_section_y=[] "Don't display encoding
let g:airline_section_z='%l/%L'
let g:airline_detect_modified=1
let g:airline#extensions#whitespace#trailing_format='[%s]' "Cleaner trailing
let g:airline#extensions#tabline#enabled = 1 "Important for tabline settings to work
let g:airline#extensions#tabline#formatter='unique_tail'
"let g:airline#extensions#tabline#fnamemod=':.'
"let g:airline#extensions#tabline#fnamecollapse=1
"let g:airline#extensions#branch#enabled=1
"let g:airline#extensions#csv#enabled=1
"let g:airline#extensions#tabline#show_buffers = 0
"highlight clear SignColumn

" ====== NERDTree
nnoremap <silent><Leader>t :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1

" ====== Emmet
let g:user_emmet_leader_key='<Leader>e'
