set nocompatible

" Vundle を使うための設定
" http://vim-users.jp/2011/04/hack215/
filetype off
set rtp+=$GOROOT/misc/vim
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Bundle の指定
"  - github から取得する ... Bundle 'user_name/repository_name'
"  - vim-scripts から取得する ... Bundle 'script_name'
"  - git リポジトリーから取得する ... Bundle 'git://url'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'fuenor/im_control.vim'
Bundle 'Pydiction'
Bundle 'taglist.vim'
Bundle 'YankRing.vim'
Bundle 'sudo.vim'
Bundle 'buftabs'
Bundle 'scrooloose/syntastic'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'davidhalter/jedi-vim'

Bundle 'wombat256.vim'

set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
" End of Vundle settings


" ------------------------------------------ base settings
syntax on
set term=xterm-256color
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
set wrapscan

" 文字コード判定
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

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

" 保存時にディレクトリーがなければ作る
" http://vim-users.jp/2011/02/hack202/
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}


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

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" buftabs
let g:buftabs_only_basename = 1

" im_contorl.vim
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-controla
let IM_CtrlMode = 6

" Insert モードを抜けるときの IM OFF 速度を調整
set timeout timeoutlen=3000 ttimeoutlen=80

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" 標準の補完を無効に
" http://mattn.kaoriya.net/software/vim/20121018212621.htm
autocmd FileType python let b:did_ftplugin = 1
