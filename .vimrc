" ########## vimrc ##########

" Vimballのインストール先設定
let g:vimball_home=$HOME."/vimfiles"

" ========== dein ==========
if &compatible
  set nocompatible
endif

"プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')

"dein.vim本体"
let s:dein_repo_dir = s:dein_dir.'/repos/github.com/Shougo/dein.vim'

"dein.vimがなければgithubから落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^='.fnamemodify(s:dein_repo_dir, ':p')
endif

"設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  "プラグインリストを収めたTOMLファイル
  "予めTOMLファイル（後述）を用意しておく
"  let g:rc_dir    = expand('~/.vim/rc')
"  let s:toml      = g:rc_dir . '/dein.toml'
"  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  "TOMLを読み込み、キャッシュしておく
"  call dein#load_toml(s:toml,       {'lazy': 0})
"  call dein#load_toml(s:lazy_toml,  {'lazy': 1})

  "-- add plugin start --
  call dein#add('Shougo/dein.vim')
"  call dein#add('Shougo/vimproc.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/syntastic')
  call dein#add('tpope/vim-fugitive')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('itchyny/lightline.vim')
  call dein#add('simeji/winresizer')
  call dein#add('majutsushi/tagbar')
  call dein#add('wesleyche/SrcExpl')
  call dein#add('vim-scripts/gtags.vim')
  "-- add plugin end --

  "設定終了
  call dein#end()
  call dein#save_state()
endif

"もし、未インストールのものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" ========== dein end ==========

"ファイルタイプ別セッティングON
filetype plugin indent on 

"日本語入力設定
set imsearch=0
set iminsert=0
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-2,latin1
set fileformats=unix,dos,mac

"挿入モードでのバックスペースの設定
set backspace=indent,eol

"検索結果のハイライトをリセットする
nnoremap  <ESC><ESC>  :nohlsearch<CR>

"Beep音を消す
set belloff=all

" ========== 表示設定 ==========

"カラースキーマを設定
colorscheme desert
"colorscheme elflord
"colorscheme evening
"colorscheme slate
"colorscheme molokai

"hilight
syntax on

"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark

"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" ========== ステータスライン設定 ==========
"set statusline=%<%f\ %m%r%h%w%y%{'\ \ \/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}%=%l,%c%V%8P
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"set laststatus=2     "2:ステータスラインを常に表示
"set statusline=%<
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%y      "filetype
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"if winwidth(0) > 130
"  set statusline+=%F
"else
"  set statusline+=%t
"endif
"set statusline+=\ %=                        " align left
"set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
"set statusline+=\ col:%c                    " current column
"set statusline+=\ buf:%n                    " Buffer number
"set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

"highlight StatusLine  term=black cterm=NONE  ctermfg=white ctermbg=white

" ========== インデント設定 ==========
"新しい行のインデントを現在行と同じにする
set autoindent
"タブの代わりに空白文字を挿入する
set expandtab
"シフト移動幅
set shiftwidth=2
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"新しい行を作ったときに高度な自動インデントを行う
set smartindent

" ========== ファイル保存設定 ==========

"スワップファイル＆バックアップファイルを作るディレクトリ
set backupdir=$HOME/backup
set directory=$HOME/backup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" ========== yank設定 ==========

"クリップボードをOSと連携
set clipboard=unnamed

" ========== search設定 ==========

"インクリメンタルサーチを行う
set incsearch
"マッチした文字列をハイライト
set hlsearch
"検索時に大文字を含んでいたら大/小を区別
set ignorecase smartcase

" ========== grep設定 ==========

" vimgrep時に自動でQuickFixを開く設定
au QuickfixCmdPost vimgrep cw

" ========== move設定 ==========

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" ========== Align設定 ==========

" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

" ========== その他設定 ==========

"for yankring
set viminfo+=!

" for MRU
let MRU_Max_Entries=50

" ========== マルチバイトを使ううえで ==========

" 記号文字の表示がおかしくならないように
set ambiwidth=double

" ========== include ==========

"source $HOME/vimfiles/keymap.vim
"source $HOME/vimfiles/functions.vim
"source $HOME/vimfiles/addft.vim

" ========== onCreate ==========

if exists('&ambiwidth')
  set ambiwidth=double
endif


" ========== ctags ==========
"set tags=./tags, ~/git-work/tags
 "tagsジャンプ時に複数ある場合は一覧表示
nnoremap  <C-]> g<C-]>

" ========== gnu global ==========
"
map <C-h> :Gtags -f %<CR>
"
map <C-j> :GtagsCursor<CR>
"
map <C-n> :cn<CR>
"
map <C-p> :cp<CR>


" ========== plugins ==========

" === unite.vim ===
"nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> ,ub :<C-u>Unite buffer<CR>


" === NERDTree ===
"隠しファイルをデフォルト表示
let NERDTreeShowHidden = 1
"キーマップ（ctrl+nで起動できるようにする）
map <C-n> :NERDTreeToggle<CR>


" === Tagbar ===
nmap <F8> :TagbarToggle<CR>

" === SrcExpl ===



" === lightline ===
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified'  ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }


" === winresizer ===
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1








cd ~/

