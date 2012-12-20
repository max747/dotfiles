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
Bundle 'bouzuya/vim-ibus'

Bundle 'othree/eregex.vim'
Bundle 'Pydiction'
Bundle 'taglist.vim'
Bundle 'YankRing.vim'
Bundle 'sudo.vim'
Bundle 'buftabs'

Bundle 'wombat256.vim'

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
set cursorline
set nopaste

" 文字コード判定
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

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

" バッファの切り替え
nnoremap <C-PageUp> :bprevious<CR>
nnoremap <C-PageDown> :bnext<CR>

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h


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
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q

" pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" yankring
let g:yankring_history_dir = expand($HOME)
let g:yankring_history_file = '.yankring_history'
let g:yankring_max_history = 10

" buftabs
let g:buftabs_only_basename = 1

" vim-ibus
:inoremap <silent> <Esc> <Esc>:<C-u>call ibus#disable()<CR>
:inoremap <silent> <C-j> <C-\><C-o>:<C-u>call ibus#toggle()<CR>
:set statusline=[%{ibus#is_enabled()?'あ':'aA'}]

