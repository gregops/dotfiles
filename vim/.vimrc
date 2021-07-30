set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

set rtp+=/${BREW_PATH}/opt/fzf

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise' " add end keyword in ruby
Plug 'tpope/vim-fugitive'
" Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround' " quotes, parens etc auto-closing
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
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
" Plug 'benmills/vimux' " Run commands in a new TMUX pane from Vim
Plug 'vimwiki/vimwiki'
Plug 'b4b4r07/vim-hcl'
Plug 'junegunn/gv.vim' " Git commit viewer
" Plug 'aserebryakov/vim-todo-lists'

if has("nvim-0.5")
  " Plug 'hrsh7th/nvim-compe' | Plug 'hrsh7th/vim-vsnip'
  " Plug 'kosayoda/nvim-lightbulb'
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'nvim-lua/lsp_extensions.nvim'
  " Plug 'nvim-lua/lsp-status.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nvim-treesitter/playground'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'rktjmp/lush.nvim'
  Plug 'npxbr/gruvbox.nvim'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'ruifm/gitlinker.nvim'
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'romgrk/barbar.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'edluffy/specs.nvim'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'haringsrob/nvim_context_vt'
endif
call plug#end()

set termguicolors

if has("nvim-0.5")
  lua require('galaxyline-config')
  lua require('gitsigns-config')
  lua require('nvim-treesitter-config')
  lua require('nvim-ts-context-commentstring-config')
  lua require('nvim-web-devicons-config')
  lua require('specs-config')
  lua require('gitlinker').setup()
  lua require('colorizer').setup()
  lua require('nvim-autopairs').setup()
  lua require('nvim_context_vt').setup()
endif

filetype plugin indent on
syntax on

let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_signs = 1

set background=dark
colorscheme gruvbox
" colorscheme tokyonight
" colorscheme flattown

set nowrap
set nomodeline
set relativenumber
" set viewoptions=cursor,folds
set number
set expandtab
set encoding=utf-8
" set t_Co=256
set list
set listchars=tab:\➔\ ,trail:⋅,extends:❯,precedes:❮
set fillchars+=stl:\ ,vert:\ ,stlnc:\
set termencoding=utf-8
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set completeopt+=longest
set nowrap
set wrapmargin=8
" set linebreak
set showbreak=↳
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
set autoindent
set smartindent
set foldmethod=syntax
set foldnestmax=6
set nofoldenable
set foldlevel=1
set clipboard+=unnamedplus
set diffopt+=vertical
set wildmenu
set wildmode=list:longest
set hidden
set shell=$SHELL
set scrolloff=6
set ignorecase
set smartcase
set nohlsearch
set incsearch
set magic
" set showmatch
set noerrorbells
set novisualbell
set timeoutlen=500
set omnifunc=syntaxcomplete#Complete
set mouse=a " Allow mouse in terminal
set guioptions-=L
set guioptions-=r
set updatetime=100
set signcolumn=yes
set colorcolumn=80
set textwidth=0

let mapleader = ' '

" Gitlinker
noremap <leader>gY :lua require("gitlinker").get_repo_url()<cr>
noremap <leader>gH :lua require("gitlinker").get_repo_url({action_callback = require("gitlinker.actions").open_in_browser})<cr>
" nnoremap <leader>gy :lua require("gitlinker").get_buf_range_url("n", {action_callback = require("gitlinker.actions").open_in_browser})<cr>
vnoremap <leader>gb :lua require("gitlinker").get_buf_range_url("v", {action_callback = require("gitlinker.actions").open_in_browser})<cr>

" Run visual selection in shell
vnoremap <leader>R :w !bash<cr>

nmap <leader>x :x<cr>
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
" Remap escape key
" inoremap jk <esc>
" Toggle paste mode
set pastetoggle=<leader>v
" Clear highlighted search
noremap <leader>h :set hlsearch! hlsearch?<cr>
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

" if isdirectory(".git")
"   " if in a git project, use :GFiles
"   nmap <silent> <leader>p :GFiles<cr>
" else
"   " otherwise, use :FZF
"   nmap <silent> <leader>p :FZF<cr>
" endif
" nmap <silent> <leader>r :Buffers<cr>

nnoremap <silent> <leader>/ :Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <leader>r :Telescope buffers<cr>
nnoremap <silent> <leader>b :Telescope file_browser<cr>
nnoremap <silent> <leader>f :Telescope find_files<cr>
nnoremap <silent> <leader>gg :Telescope git_files<cr>
nnoremap <silent> <leader>sh :Telescope search_history<cr>
nnoremap <silent> <leader>ch :Telescope command_history<cr>
nnoremap <silent> <leader>lg :Telescope live_grep<cr>

" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
" nmap <leader>ge :Gedit<cr>
" nmap <silent><leader>gr :Gread<cr>
" nmap <silent><leader>gb :Gblame<cr>

" nmap <M-Right> :bn!<CR>
" nmap <M-Left> :bp!<CR>
nmap <silent><leader>d :bd!<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:fzf_layout = { 'down': '~25%' }
let NERDTreeShowHidden=1
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
let g:markdown_fenced_languages = ['ruby', 'python', 'css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" " Removes trailing spaces
" function TrimWhiteSpace()
"   %s/\s*$//
"   ''
" :endfunction

" au FileWritePre * :call TrimWhiteSpace()
" au FileAppendPre * :call TrimWhiteSpace()
" au FilterWritePre * :call TrimWhiteSpace()
" au BufWritePre * :call TrimWhiteSpace()

" hi MatchParen term=underline cterm=underline gui=underline
" hi MatchParen guibg=magenta
" hi LineNr guibg=#000000 guifg=#aaaaaa ctermbg=232 ctermfg=249
" hi SpecialKey ctermbg=none ctermfg=8
" hi NonText ctermbg=none ctermfg=8
" hi SignColumn guibg=#000000 ctermbg=234
" hi VertSplit guibg=#bf1111 guifg=#010101 ctermfg=green ctermbg=23
" hi CursorColumn ctermbg=234 guibg=#333333
" hi CursorLine ctermbg=234 guibg=#333333
" hi! StatusLine ctermfg=green ctermbg=darkred
" hi! StatusLineNC ctermfg=green ctermbg=darkred
" highlight VertSplit cterm=NONE ctermfg=Green ctermbg=White guibg=#B0B0B0 guifg=#B0B0B0

autocmd FileType yaml setl ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setl indentkeys-=:

" let g:gitgutter_realtime = 1
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_highlight_lines = 0
" let g:ruby_operators=1
" let g:session_autosave=0
" let b:surround_{char2nr('=')} = "<%= \r %>"
" let b:surround_{char2nr('-')} = "<% \r %>"
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:DevIconsEnableFoldersOpenClose = 1

nnoremap <leader>sv :source $MYVIMRC<CR>

" Barbar
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = "both"
nnoremap <silent> <M-Left> :BufferPrevious<CR>
nnoremap <silent> <M-Right> :BufferNext<CR>
nnoremap <silent> <M-1> :BufferGoto 1<CR>
nnoremap <silent> <M-2> :BufferGoto 2<CR>
nnoremap <silent> <M-3> :BufferGoto 3<CR>
nnoremap <silent> <M-4> :BufferGoto 4<CR>
nnoremap <silent> <M-5> :BufferGoto 5<CR>
nnoremap <silent> <M-6> :BufferGoto 6<CR>
nnoremap <silent> <M-7> :BufferGoto 7<CR>
nnoremap <silent> <M-8> :BufferGoto 8<CR>
nnoremap <silent> <M-9> :BufferGoto 9<CR>

" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_theme = 'papercolor'
" let g:airline_inactive_collapse=0
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.whitespace = 'Ξ'
" let g:airline_symbols.space = ' '
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_splits = 1
" let g:airline#extensions#tabline#show_close_button = 1
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#tabs_label = 'tabs'
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>- <Plug>AirlineSelectPrevTab
" nmap <leader>+ <Plug>AirlineSelectNextTab
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_section_c = '%<%<%m %F %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

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

au BufRead,BufNewFile *.yaml set filetype=yaml
au BufRead,BufNewFile *.tpl set filetype=mustache
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile

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
