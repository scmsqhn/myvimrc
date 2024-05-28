syntax on
set expandtab
set background=dark
""colorscheme dark
""colorscheme desert
filetype on

au BufRead,BufNewFile *.sv set filetype=systemverilog
au BufRead,BufNewFile *.v  set filetype=verilog

""set spell
set history=200

set wildmode=longest,list

set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

set tags=./tags,tags

set mouse=nvi  " 只在普通模式、可视模式和插入模式下启用鼠标支持
"禁用mouse" set mouse=

set encoding=utf-8
set number
set autoindent

set ts=2
set expandtab

set shiftwidth=4
autocmd FileType make set noexpandtab

" On :LS!, <bang> evaluates to '!', and '!0' becomes 1
""command! LS call fzf#run(fzf#wrap({'source': 'ls'}))
""command! -bang LS call fzf#run(fzf#wrap({'source': 'ls'}, <bang>0))

command! -bang -complete=dir -nargs=? LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))

set hlsearch
""set cursorline

""set cursorcolumn
set guifont=Monospace\ 16
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap < <><Esc>i

" 快速打开和关闭 Quickfix 窗口的键映射
nnoremap <C-e> :copen<CR>
nnoremap <C-c> :cclose<CR>

" 在 Quickfix 列表中导航错误的键映射
nnoremap <f8> :cnext<CR>
nnoremap <f9> :cprev<CR>

" 打开 Quickfix 窗口时自动调整高度
autocmd FileType qf wincmd J
autocmd FileType qf setlocal nobuflisted
autocmd QuickFixCmdPost [grep|make] cwindow

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>


autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

let mapleader="\\"
" 按 <leader>w 保存文件
nnoremap <leader>w :w<cr>
" 按 <leader>2 执行上一次的宏
nnoremap <leader>2 @@
" 可视模式下按 <leader>y 将内容写入系统寄存器
"vnoremap <leader>y "+y
vnoremap y y<CR>:call system('xclip -selection clipboard', @")<CR>

" 按 <leader>p 将系统寄存器中的内容粘贴出来
nnoremap <leader>p "+p
" 按 <leader>no 取消搜索高亮, 没错, <leader> 键后面可以跟键序列
nnoremap <leader>no :nohlsearch<cr>
" 按 <leader>k 向上移动半屏
nnoremap <leader>k <C-u>
" 按 <leader>j 向下移动半屏
nnoremap <leader>j <C-d>

nnoremap <leader>fc :NERDTreeFocus<CR>
nnoremap <leader>tg :NERDTreeToggle<CR>
nnoremap <leader>fd :NERDTreeFind<CR>

""nnoremap <f5> :!ctags -R .<CR>
" 为特定的文件类型设置 ctags 更新
autocmd FileType python autocmd BufWritePost <buffer> call system("ctags -R")
autocmd FileType c      autocmd BufWritePost <buffer> call system("ctags -R")
autocmd FileType cpp    autocmd BufWritePost <buffer> call system("ctags -R")
source ~/.vim/user/alias.vim

call plug#begin()

" List your plugins here
"
Plug 'ekalinin/Dockerfile.vim'
""Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'godlygeek/tabular'
""Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
""Plug 'iamcco/mathjax-support-for-mkdp'
""Plug 'iamcco/markdown-preview.vim'

""nnoremap <leader>8 <Plug>MarkdownPreview        " for normal mode
""inoremap <leader>8 <Plug>MarkdownPreview        " for insert mode
""nnoremap <leader>9 <Plug>StopMarkdownPreview    " for normal mode
""inoremap <leader>9 <Plug>StopMarkdownPreview    " for insert mode

" Make sure you use single quotes

" Shorthand notation for GitHub; translates to https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/seoul256.vim.git'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Using a non-default branch
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Use 'dir' option to install plugin in a non-default directory
""Plug 'junegunn/fzf', { 'dir': '~/.fzf' }

" Post-update hook: run a shell command after installing or updating the plugin
""Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Post-update hook can be a lambda expression
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" If the vim plugin is in a subdirectory, use 'rtp' option to specify its path
Plug 'nsf/gocode', { 'rtp': 'vim' }

" On-demand loading: loaded when the specified command is executed
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" On-demand loading: loaded when a file with a specific file type is opened
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Unmanaged plugin (manually installed and updated)
""Plug '/home/oem/.vim/pack/tpope/start/unimpaired/plugin'

" Call plug#end to update &runtimepath and initialize the plugin system.
" - It automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
"
filetype plugin on
set number   ""optionally add this to show line numbers in vim
