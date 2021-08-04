set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

set rtp+=/${BREW_PATH}/opt/fzf

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
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
" Plug 'vim-ruby/vim-ruby'
Plug 'jamessan/vim-gnupg'
Plug 'fatih/vim-go', { 'for': 'go' } " go support
" Plug 'Valloric/MatchTagAlways'
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'sickill/vim-pasta' " context-aware pasting
" Plug 'pearofducks/ansible-vim' " Ansible's special-needs YAML highlight and indent handling
Plug 'Glench/Vim-Jinja2-Syntax' " Jinja2 highlighting
" Plug 'Yggdroot/indentLine' " Indentation lines for code
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
Plug 'sheerun/vim-polyglot'
" Plug 'aserebryakov/vim-todo-lists'

" Both nvim-autopairs and lexima are broken
" Plug 'windwp/nvim-autopairs'
" Plug 'cohama/lexima.vim'
Plug 'jiangmiao/auto-pairs'

if has("nvim-0.5")
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  " Plug 'kosayoda/nvim-lightbulb'
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
  Plug 'windwp/nvim-ts-autotag'
  Plug 'edluffy/specs.nvim'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'haringsrob/nvim_context_vt'
  Plug 'folke/lsp-colors.nvim'
  Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
  Plug 'jghauser/mkdir.nvim'
  Plug 'yamatsum/nvim-cursorline'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'ray-x/go.nvim'
  Plug 'phaazon/hop.nvim'
  Plug 'ggandor/lightspeed.nvim'
  Plug 'kevinhwang91/nvim-hlslens'
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
  lua require('nvim-compe-config')
  lua require('nvim-lspconfig-config')
  lua require('lspsaga-config')
  " lua require('nvim-autopairs-config')
  lua require('mkdir')
  lua require('gitlinker').setup()
  lua require('colorizer').setup()
  lua require('nvim_context_vt').setup()
  lua require('nvim-ts-autotag').setup()
  lua require('go').setup()
  lua require('hop').setup()
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

set wrap
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
" set completeopt+=longest
set nowrap
" set wrapmargin=8
set linebreak
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
set hlsearch
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

let mapleader = ','

" VSnip
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Gitlinker
noremap <leader>gy :lua require("gitlinker").get_repo_url()<cr>
noremap <leader>gB :lua require("gitlinker").get_repo_url({action_callback = require("gitlinker.actions").open_in_browser})<cr>
nnoremap <leader>gb :lua require("gitlinker").get_buf_range_url("n", {action_callback = require("gitlinker.actions").open_in_browser})<cr>
vnoremap <leader>gb :lua require("gitlinker").get_buf_range_url("v", {action_callback = require("gitlinker.actions").open_in_browser})<cr>

nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Glow toggle
noremap <leader>G :Glow<CR>

set completeopt=menuone,noselect

" Run contents of visual selection in shell
vnoremap <leader>R :w !bash<cr>

nnoremap <leader>W :HopWord<cr>
nnoremap <leader>C :HopChar1<cr>

nmap <leader>x :x<cr>
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
" Remap escape key
" inoremap jk <esc>
" Toggle paste mode
set pastetoggle=<leader>v
" Clear highlighted search
noremap <leader>hl :set hlsearch! hlsearch?<cr>
" Mac clipboard support
vmap '' :w !pbcopy<CR>< R>
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

" augroup configgroup
"   autocmd!
"   " Automatically resize panes on resize
"   autocmd VimResized * exe 'normal! \<c-w>='
"   " Automatically reload vimrc - breaks theming!
"   " autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
"   " autocmd BufWritePost .vimrc.local source %
"   autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
"   autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" augroup END

nnoremap <silent> <leader>k :NvimTreeToggle<CR>
nnoremap <silent> <leader>K :NvimTreeFindFile<CR>

" Fugitive Shortcuts
nmap <silent> <leader>gs :Git<cr>
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

let g:ruby_operators=1
" let g:session_autosave=0
" let b:surround_{char2nr('=')} = "<%= \r %>"
" let b:surround_{char2nr('-')} = "<% \r %>"
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

let g:vim_json_syntax_conceal = 0

" lukas-reineke/indent-blankline.nvim (uses similar options to Yggdroot/indentLine)
let g:indentLine_color_gui = '#ffffff'
let g:indentLine_color_term = 239
" let g:indent_blankline_char = '⎸'
" let g:indent_blankline_char = '▏'
let g:indent_blankline_char = '│'
let g:indent_blankline_indent_level = 20
" let g:indent_blankline_show_end_of_line = v:true
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
highlight IndentBlanklineContextChar guifg=#888888 gui=nocombine
let g:indent_blankline_context_patterns = ['class', 'function', 'method', 'for', 'while', 'if']

" let g:python3_host_prog = $HOME . '/bin/python'
" let g:python2_host_prog = $HOME . '/bin/python2'
let g:vimwiki_list = [{'path': '~/Dropbox/notes', 'syntax': 'markdown', 'ext': '.md'}]

au BufRead,BufNewFile *.yaml set filetype=yaml
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

" From https://z0mbix.io/2018/03/28/quickly-access-terraform-docs-from-the-cli-or-vim/
if executable('tfdoc')
  command! -nargs=* Tfdoc :call system('tfdoc' . ' ' . <q-args>)
endif
nnoremap <silent> <Leader>tr :Tfdoc <C-R><C-W><CR>
nnoremap <silent> <Leader>td :Tfdoc -d <C-R><C-W><CR>
xnoremap <silent> <Leader>tr y:Tfdoc <C-R>"<CR>
xnoremap <silent> <Leader>td y:Tfdoc -d <C-R>"<CR>
