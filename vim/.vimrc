set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
set rtp+=/usr/local/opt/fzf

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'MarcWeber/vim-addon-mw-utils' " required by snipmate
Plug 'tomtom/tlib_vim' " required by snipmate
Plug 'garbas/vim-snipmate' " snippet manager
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise' " add end keyword in ruby
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround' " quotes, parens etc auto-closing
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
Plug 'vim-ruby/vim-ruby'
Plug 'jamessan/vim-gnupg'
Plug 'fatih/vim-go', { 'for': 'go' } " go support
" Plug 'Valloric/MatchTagAlways'
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'pearofducks/ansible-vim' " Ansible's special-needs YAML highlight and indent handling
Plug 'Glench/Vim-Jinja2-Syntax' " Jinja2 highlighting
Plug 'Yggdroot/indentLine' " Indentation lines for code
Plug 'junegunn/vim-easy-align'
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'chemzqm/vim-easygit'
Plug 'hashivim/vim-terraform'
Plug 'farmergreg/vim-lastplace'
Plug 'christoomey/vim-tmux-navigator' " Navigate TMUX panes and Vim splits
Plug 'benmills/vimux' " Run commands in a new TMUX pane from Vim
Plug 'vimwiki/vimwiki'
Plug 'b4b4r07/vim-hcl'
Plug 'ap/vim-css-color' " Set background of CSS colors in Vim
Plug 'junegunn/gv.vim' " Git commit viewer
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }
Plug 'aserebryakov/vim-todo-lists'

call plug#end()
filetype plugin indent on
syntax on

colorscheme flattown

set nomodeline
set relativenumber
set viewoptions=cursor,folds,slash,unix
set number
set expandtab
set background=dark
set hlsearch
set laststatus=2
set guifont=SFMono\ Nerd\ Font:h18
set encoding=utf-8
set t_Co=256
set list
set listchars=tab:\ \ ,trail:⋅,extends:❯,precedes:❮
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
set clipboard=unnamed
set ttyfast
set diffopt+=vertical
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
set noerrorbells " Disable sound bells
set visualbell
set t_vb=
set tm=500
set omnifunc=syntaxcomplete#Complete
set mouse=a " Allow mouse in terminal
set termguicolors
set guioptions-=L
set guioptions-=r
set updatetime=250
set signcolumn=yes
set textwidth=0

" Remap leader key
let mapleader = ','
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
" Mac clipboard support
vmap '' :w !pbcopy<CR><CR>
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
" nnoremap <silent> ^ g^
" nnoremap <silent> $ g$
" nnoremap <silent> 0 g0
" Search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>
augroup configgroup
  autocmd!
  " Automatically resize panes on resize
  autocmd VimResized * exe 'normal! \<c-w>='
  " Automatically reload vimrc - breaks theming!
  " autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
  " autocmd BufWritePost .vimrc.local source %
  autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END
" Run eslint linter for JS files every time they're saved
" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" Expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
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
nmap <M-Right> :bn!<CR>
nmap <M-Left> :bp!<CR>
nmap <silent><leader>d :bd!<cr>
" nnoremap <silent> <Right> :tabnext<CR>
" nnoremap <silent> <Left> :tabprevious<CR>
" nnoremap <silent> <leader>t :tabnew<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:fzf_layout = { 'down': '~25%' }
let NERDTreeShowHidden=1
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
let g:markdown_fenced_languages = ['ruby', 'python', 'css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" hi MatchParen term=underline cterm=underline gui=underline
" hi MatchParen guifg=magenta
hi LineNr guibg=#000000 guifg=#aaaaaa ctermbg=232 ctermfg=249
hi SpecialKey ctermbg=none ctermfg=8
hi NonText ctermbg=none ctermfg=8
hi SignColumn guibg=#000000 ctermbg=234
hi VertSplit guibg=#bf1111 guifg=#010101 ctermfg=green ctermbg=23
hi CursorColumn ctermbg=234 guibg=#333333
hi CursorLine ctermbg=234 guibg=#333333
" hi! StatusLine ctermfg=green ctermbg=darkred
" hi! StatusLineNC ctermfg=green ctermbg=darkred
" highlight VertSplit cterm=NONE ctermfg=Green ctermbg=White guibg=#B0B0B0 guifg=#B0B0B0

autocmd FileType yaml setl ts=4 sts=4 sw=4 expandtab
autocmd FileType yaml setl indentkeys-=:

let g:gitgutter_realtime = 1
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_highlight_lines = 0
" let g:ruby_operators=1
" let g:session_autosave=0
" let b:surround_{char2nr('=')} = "<%= \r %>"
" let b:surround_{char2nr('-')} = "<% \r %>"
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
let g:airline_theme = 'papercolor'
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
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_c = '%<%<%m %F %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

let g:vim_json_syntax_conceal = 0
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.js,*.erb'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_close_shortcut = '<leader>>'
let g:indentLine_color_gui = '#444444'
let g:indentLine_color_term = 239
let g:indentLine_char = '⎸'
let g:python3_host_prog = $HOME . '/bin/python'
let g:python2_host_prog = $HOME . '/bin/python2'
let g:vimwiki_list = [{'path': '~/Dropbox/notes', 'syntax': 'markdown', 'ext': '.md'}]

au BufRead,BufNewFile *.yaml set filetype=yaml.ansible
au BufRead,BufNewFile *.tpl set filetype=mustache
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile Dockerfile* set filetype=Dockerfile

" Keybase saltpack auto-encryption/decryption
augroup SALTPACK
  au!
  au BufReadPre,FileReadPre *.saltpack set viminfo=
  au BufReadPre,FileReadPre *.saltpack set noswapfile noundofile nobackup
  au BufReadPost,FileReadPost *.saltpack :%!keybase decrypt 2>/dev/null
  au BufWritePre,FileReadPre *.saltpack :exec "%!keybase encrypt $(keybase id -j | jq -r '.username')"
  au BufWritePost,FileReadPost *.saltpack silent u
augroup END

" let g:ale_sign_error = '●' " Less aggressive than the default '>>'
" let g:ale_sign_warning = '.'
" let g:ale_sign_column_always = 1
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" From https://z0mbix.io/2018/03/28/quickly-access-terraform-docs-from-the-cli-or-vim/
if executable('tfdoc')
  command! -nargs=* Tfdoc :call system('tfdoc' . ' ' . <q-args>)
endif
nnoremap <silent> <Leader>tr :Tfdoc <C-R><C-W><CR>
nnoremap <silent> <Leader>td :Tfdoc -d <C-R><C-W><CR>
xnoremap <silent> <Leader>tr y:Tfdoc <C-R>"<CR>
xnoremap <silent> <Leader>td y:Tfdoc -d <C-R>"<CR>

if has("gui_running")
  set noballooneval
endif
