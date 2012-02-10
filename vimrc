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

filetype plugin indent on
" End of Vundle settings


syntax on
set autoindent
set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard=unnamed,autoselect
set hlsearch

set laststatus=2
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:$

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

let g:netrw_sort_sequence="[\\/]$,*,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*[\\/]$,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*$,\\.o$,\\.info$,\\.swp$,\\.obj$ "


