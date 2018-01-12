set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
set rtp+=/usr/local/opt/fzf
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mhinz/vim-startify'
Plug 'MarcWeber/vim-addon-mw-utils' " required by snipmate
Plug 'tomtom/tlib_vim' " required by snipmate
Plug 'ervandew/supertab'
Plug 'garbas/vim-snipmate' " snippet manager
Plug 'ntpeters/vim-better-whitespace'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise' " add end keyword in ruby
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround' " quotes, parens etc auto-closing
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'benmills/vimux' " tmux integration for vim
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'vim-ruby/vim-ruby'
Plug 'jamessan/vim-gnupg'
" Plug 'tyru/winmove.vim'
Plug 'tpope/vim-markdown'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-github-dashboard'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
Plug 'gavocanov/vim-js-indent' " JavaScript indent support
Plug 'moll/vim-node' " node support
Plug 'othree/yajs.vim' " JavaScript syntax plugin
Plug 'othree/es.next.syntax.vim' " ES6 and beyond syntax
Plug 'mxw/vim-jsx' " JSX support
Plug 'mattn/emmet-vim' " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag' " match tags in html, similar to paren support
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'othree/html5.vim' " html5 support
Plug 'pearofducks/ansible-vim' " Ansible's special-needs YAML highlight and indent handling
Plug 'Glench/Vim-Jinja2-Syntax' " Jinja2 highlighting
Plug 'alvan/vim-closetag' " (X)HTML tag auto-closing
call plug#end()
filetype plugin indent on
syntax on
set relativenumber
set viewoptions=cursor,folds,slash,unix
set number
set expandtab
set background=dark
if has("gui_running")
  colorscheme flattown
else
  colorscheme flattown
endif
set hlsearch
set laststatus=2
set guifont=InconsolataForPowerline\ Nerd\ Font:h16
set encoding=utf-8
set t_Co=256
set list
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮
set fillchars+=stl:\ ,vert:\ ,stlnc:\ 
set termencoding=utf-8
set ruler
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set completeopt+=longest
set wrap
" set wrapmargin=8
set linebreak
set showbreak=…
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
set autoindent
set smartindent
set foldmethod=syntax
set foldnestmax=6
set nofoldenable
set foldlevel=1
" set clipboard=unnamed
set ttyfast
set diffopt+=vertical
set laststatus=2
set wildmenu
set wildmode=list:longest
set scrolloff=3
set hidden
set showcmd
set shell=$SHELL
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set magic
set showmatch
" Disable sound bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
" Allow mouse in terminal
" set mouse=a
" Remap leader key
let mapleader = ','
" Toggle Limelight
nmap <leader>l :Limelight!!<cr>
" Quick write and quit
nmap <leader>x :x<cr>
" Quick quit
nmap <leader>q :q<cr>
" Quick saving
nmap <leader>w :w<cr>
" Remap escape key
inoremap jk <esc>
" Toggle paste mode
set pastetoggle=<leader>v
" Clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>
" Remove extra whitespace (entire file)
nmap <leader><space> :%s/\s\+$<cr>
" Indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>
" Enable . command in visual mode
vnoremap . :normal .<cr>
" Window moving/creating shortcuts
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
" Toggle cursor line
nnoremap <leader>i :set cursorline!<cr>
nnoremap <leader>I :set cursorcolumn!<cr>
" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Navigate in wrapped lines as if they were separate lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <silent> ^ g^
nnoremap <silent> $ g$
nnoremap <silent> 0 g0
" Search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>
augroup configgroup
  autocmd!
  " Automatically resize panes on resize
  autocmd VimResized * exe 'normal! \<c-w>='
  " Automatically reload vimrc
  autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
  autocmd BufWritePost .vimrc.local source %
  autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" Expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
let g:fzf_layout = { 'down': '~25%' }
if isdirectory(".git")
  " if in a git project, use :GFiles
  nmap <silent> <leader>p :GFiles<cr>
else
  " otherwise, use :FZF
  nmap <silent> <leader>p :FZF<cr>
endif
nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>
nnoremap <silent> <Right> :tabnext<CR>
nnoremap <silent> <Left> :tabprevious<CR>
nnoremap <silent> <leader>t :tabnew<CR>
let NERDTreeShowHidden=1
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
let g:markdown_fenced_languages = ['ruby', 'python', 'css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
if (empty($TMUX) && has("termguicolors"))
  set termguicolors
endif
hi MatchParen guifg=magenta
hi LineNr guibg=#000000 guifg=#aaaaaa ctermbg=232
hi SpecialKey ctermbg=none ctermfg=8
hi NonText ctermbg=none ctermfg=8
hi SignColumn guibg=#000000
hi VertSplit guibg=#bf1111 guifg=#010101 ctermfg=green ctermbg=23
hi CursorColumn ctermbg=234 guibg=#755555 guifg=#010101
hi CursorLine ctermbg=234 guibg=#755555 guifg=#010101
" hi! StatusLine ctermfg=green ctermbg=darkred
" hi! StatusLineNC ctermfg=green ctermbg=darkred
" highlight VertSplit cterm=NONE ctermfg=Green ctermbg=White guibg=#B0B0B0 guifg=#B0B0B0
set guioptions-=L
set guioptions-=r
if executable('ag')
  set grepprg=ag\ --nogroup
  let g:ctrlp_user_command = 'ag %s -l -g ""'
  let g:ctrlp_use_caching = 0
endif
autocmd FileType yaml setl ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setl indentkeys-=:
let g:ctrlp_user_command = 'ag %s -i --nogroup --hidden --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore "**/*.pyc" -g ""'
hi LineNr guifg=#999999
set updatetime=250
set signcolumn=yes
let g:gitgutter_realtime = 1
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_highlight_lines = 0
let g:ruby_operators=1
let g:session_autosave=0
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme = 'molokai'
let g:airline_inactive_collapse=0
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = ' '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tabs_label = 'tabs'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:vim_json_syntax_conceal = 0
let g:jsx_ext_required = 0
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.js,*.erb'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_close_shortcut = '<leader>>'
if has("gui_running")
  set noballooneval
endif
set textwidth=0

" --- Some old settings ---
" set statusline+=%{SyntasticStatuslineFlag()}
" nmap <F7> :SyntasticToggleMode<CR>
" nmap <F8> :TagbarToggle<CR>
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_check_on_w = 0
" let g:instant_markdown_autostart = 0
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" map <D-r> :CtrlPTag<cr>
" let g:user_emmet_leader_key='<D-d>'
" let g:user_emmet_settings = { 'haml' : { 'extends' : 'html', } }
" map! <D-e> <C-y>,
" set ttimeoutlen=10
" set linespace=-2
" let g:Powerline_symbols = 'unicode'
