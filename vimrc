set nocompatible

" Vundle を使うための設定
" http://vim-users.jp/2011/04/hack215/
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Bundle の指定
"  - github から取得する ... Bundle 'user_name/repository_name'
"  - vim-scripts から取得する ... Bundle 'script_name'
"  - git リポジトリーから取得する ... Bundle 'git://url'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'

Bundle 'Smooth-Scroll'
Bundle 'eregex.vim'
Bundle 'Pydiction'
Bundle 'taglist.vim'
Bundle 'YankRing.vim'
Bundle 'sudo.vim'

Bundle 'desert256.vim'

filetype plugin indent on
" End of Vundle settings


" ------------------------------------------ base settings
syntax on
set autoindent
set smartindent
set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard=unnamed,autoselect
set hlsearch
set ruler
set wildmenu
set backspace=indent,eol,start
set showmatch
set autoread

" 制御文字等を表示
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:$

" 全角スペースを表示
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

" filetype の自動セット
autocmd BufRead,BufNewFile .vimperatorrc    set filetype=vimperator
autocmd BufRead,BufNewFile *.rst            set filetype=rst

" http://d.hatena.ne.jp/viver/20070612/p1
" バックアップを作成するディレクトリーを指定する
set backup
set backupdir=$HOME/.vimbackup
let &directory=&backupdir

" 検索結果のハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ウィンドウを分割してファイラーを表示
map <C-W><C-V> :Vexplore!<CR>
map <C-W><C-H> :Hexplore<CR>
map! <C-W><C-V> <Esc>:Vexplore!<CR>
map! <C-W><C-H> <Esc>:Hexplore<CR>

" ファイラーに表示されるアイテムのソート順を定義
let g:netrw_sort_sequence="[\\/]$,*,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*[\\/]$,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*$,\\.o$,\\.info$,\\.swp$,\\.obj$ "

" ファイラーでカレントディレクトリを表示しない
set directory-=.

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> :<C-w>j
nnoremap <C-k> :<C-k>j
nnoremap <C-l> :<C-l>j
nnoremap <C-h> :<C-h>j

" -------------------------------------------------- plugin settings

" powerline
set laststatus=2
let g:Powerline_symbols='fancy'

" neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_temporary_dir = $HOME.'/.vim/tmp/plugin/.neocomplcache'

" unite.vim
let g:unite_data_directory = expand('~/.vim/tmp/plugin/.unite')

" pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" yankring
let g:yankring_history_dir = expand($HOME)
let g:yankring_history_file = '.yankring_history'
let g:yankring_max_history = 10

