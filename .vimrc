
"######## KEY MAPPINGS #########""

let mapleader = ","
inoremap jj <ESC>

" move to next buffer
nmap <leader>bk :bnext<CR>
"move to previous buffer
nmap <leader>bj :bprevious<CR>
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

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
let g:acp_enableAtSartup = 0
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 2
" increase limit for tag cache files
let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
" fuzzy completion breaks dot-repeat more noticeably
" https://github.com/Shougo/neocomplete.vim/issues/332
let g:neocomplete#enable_fuzzy_completion = 0
" always use completions from all buffers
if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes._ = '_'

" enable omni-completion for Ruby and PHP
call neocomplete#util#set_default_dictionary(
            \'g:neocomplete#sources#omni#input_patterns', 'ruby',
            \'[^. *\t]\.\h\w*\|\h\w*::\w*')
call neocomplete#util#set_default_dictionary(
            \'g:neocomplete#sources#omni#input_patterns',
            \'php',
            \'[^. \t]->\h\w*\|\h\w*::\w*')
" enable tern
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '\h\w*\|[^. \t]\.\w*'
" from neocomplete.txt:
" ---------------------
" Plugin key-mappings.
inoremap <expr> <C-g> neocomplete#undo_completion()
inoremap <expr> <C-l> neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: cancel popup and insert newline.
inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
" <TAB>: completion.
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <C-y> neocomplete#close_popup()


" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


" Supertab autocomplete
set omnifunc=syntaxcomplete#Complete
autocmd Filetype javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd Filetype html set omnifunc=htmcomplete#CompleteTags
autocmd Filetype css set omnifunc=csscomplete#CompleteCSS
set completeopt=menu
let g:SuperTabDefaultCompletionType="context"
" to do text select via j/k
"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Jedi Autocomplete (use tabs when going to a def)
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"


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
nnoremap <C-w>E :SyntasticToggleMode<CR>
nnoremap <C-w>e :SyntasticCheck<CR> 
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
let g:syntastic_auto_jump = 2
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

" vim-jsx
" Allow JSX in normal JS files"
let g:jsx_ext_required = 0 
set rtp+=~/.vim/bundle/jsx.vim

"SingleCompile bind (compiler)
nmap <leader>[ :SCCompile<cr>
nmap <leader>] :SCCompileRun<cr>
nmap <leader>{ :SCChooseCompiler<cr>
nmap <leader>} :SCViewResult<cr>

"tern for vim
let g:tern_map_keys=1


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
" Zenburn
set t_Co=256
set background=dark
colorscheme tomorrow-night
" colorscheme zenburn

"Solarized
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized


" search with /
set showmatch
set incsearch
set hlsearch

"set files to unix 
"forEach non-unix EOL, CR shows as ^M
set fileformats=unix

"set 4 character indentation and tabbing
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set showtabline=2
set autoindent
set smarttab

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


