
"######## KEY MAPPINGS #########""

let mapleader = ","
inoremap jj <ESC>

" move to next buffer
nmap <leader>1 :bnext<CR>
"move to previous buffer
nmap <leader>h :bprevious<CR>
"close current buffer and move to previous one
nmap <leader>bq :bp <BAR> bd #<CR>
"show all open buffers and their status
nmap <leader>b1 :ls<CR>

map <leader>k :E<cr>

"save session
"(re-open with 'vi -S')
nnoremap <leader>s :mksession<CR>
nnoremap <leader>s! :mksession!<CR>

"fold with space
nnoremap <space> za

"Movement
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
vnoremap B ^
nnoremap E $
vnoremap E $

" provide hjkl in Insert mode and Command-line mode via <Alt> modifier
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>

"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 

"toggle special paste mode
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p
set showmode


"tab navigation 
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tq :bp <BAR> bd #<CR> tabclose<CR>
nnoremap <leader>tc :tabclose<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"######## PLUGINS SETTINGS #########""

" Pathogen runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim 
execute pathogen#infect()

" Jedi Autocomplete (use tabs when going to a def)
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
 
" Neocomplete
let g:neocomplete#enable_at_startup = 1

" NERDTree shortcuts below
nnoremap <leader>E  :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Disable NERDTree unicode arrows (when lack of Unicode support)
"let g:NERDTreeDirArrows=0

" Tagbar 
nmap <leader>` :TagbarToggle<CR>
"support for javascript ctags (check .ctags)
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
\ }

" Syntastic 
" toggle
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
" use ESLint:
let g:syntastic_javascript_checkers = ['eslint']
" recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" disable syntastic by default and use error-checking with 
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }
" additional syntax checkers
let g:syntastic_c_checkers = ['check']
let g:syntastic_cpp_checkers = ['check']


" Vim-Emmet 
" remap leader key from <C-Y> (still have to type "," after)
" Note: same as window-manager
let g:user_emmet_leader_key='<C-e>'

" Vim-Airline
" list buffers across top (vim-airline)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Gundo toggle 
nnoremap <leader>u :GundoToggle<CR>

"Silver Searcher (open ag.vim)
nnoremap <leader>a :Ag
let g:ag_working_path_mode="r"

" Ctrl-P settings
let g:ctrlp_match_window = 'botom,order:ttb'
let g:ctrlp_switch_buffer = 0
" use nearest .git (or similar) directory as the cwd
let g:ctrlp_working_path_mode = 'ra'
" use silver surfer for search (faster than default)
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}
" easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>bl :CtrlPLine<cr>

" Vim jsx
" Allow JSX in normal JS files"
let g:jsx_ext_required = 0 
set rtp+=~/.vim/bundle/jsx.vim

"SingleCompile bind
nmap <leader>[ :SCCompile<cr>
nmap <leader>] :SCCompileRun<cr>
nmap <leader>{ :SCChooseCompiler<cr>
nmap <leader>} :SCViewResult<cr>

"######## FUNCTIONALITY SETTINGS #########""


" make backspace work properly
set backspace=indent,eol,start

" Visual
syntax enable
set cursorline
set number
set showcmd
set cmdheight=2
set numberwidth=5

"Color Schemes
"Zenburn
set t_Co=256
set background=dark
colorscheme zenburn

"Solarized
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized


" search with /
set showmatch
set incsearch
set hlsearch

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set showtabline=2
set autoindent
filetype plugin indent on

set laststatus=2
set ignorecase smartcase
set shell=bash
set switchbuf=useopen
"allow buffer to be hidden if you've modified it
set hidden
set mouse=a


set wildmenu "visual autocompete for command menu
set lazyredraw "redraw only when we need to
set showmatch " highlight matching [{()}]

"code folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" allow cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif




