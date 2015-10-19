inoremap jj <ESC>
let mapleader = ","



" neocomplete
let g:neocomplete#enable_at_startup = 1

" NERDTree shortcuts below
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>E  :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

" Disable NERDTree unicode arrows (for lack of Unicode support)
"let g:NERDTreeDirArrows=0

" added Tagbar
nmap <leader>` :TagbarToggle<CR>

" Pathogen runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()


" support for .jsx files 
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

" Finally, configure Syntastic to use ESLint:
let g:syntastic_javascript_checkers = ['eslint']
" ""add this too: // [OR THIS]
"let g:syntastic_javascript_checkers = ['jsxhint']
"let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

"vim-emmet remap leader key from <C-Y> (still have to type "," after)
" Note: same as window-manager
let g:user_emmet_leader_key='<C-W>'

" list buffers across top (vim-airline)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"allow buffer to be hidden if you've modified it
set hidden
" replace tabnew
nmap <leader>T :tabnew<cr>
" move to next buffer
nmap <leader>1 :bnext<CR>
"move to previous buffer
nmap <leader>h :bprevious<CR>
"close current buffer and move to previous one
nmap <leader>bq :bp <BAR> bd #<CR>
"show all open buffers and their status
nmap <leader>b1 :ls<CR>


"
set cursorline
map <leader>k :E<cr>
let g:netrw_liststyle=3
set number
colorscheme zenburn
filetype plugin indent on
filetype indent on
set wildmenu "visual autocompete for command menu
set lazyredraw "redraw only when we need to
set showmatch " highlight matching [{()}]


syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 
set showcmd

"Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

"Movement
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" provide hjkl in Insert mode and Command-line mode via <Alt> modifier
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

"save session
"(re-open with 'vi -S')
nnoremap <leader>s :mksession<CR>

"Silver Searcher (open ag.vim)
nnoremap <leader>a :Ag
let g:ag_working_path_mode="r"

" CtrlP settings
let g:ctrlp_match_window = 'botom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" use silver surfer for search (faster)
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}
" use nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'
" easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>


" allow cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set ignorecase smartcase

set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set shell=bash

set t_Co=256
set background=dark
