set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree' "ファイルをtree表示してくれる
NeoBundle 'tomtom/tcomment_vim' "コメントON/OFFを手軽に実行
NeoBundle 'vim-scripts/AnsiEsc.vim' "ログファイルを色づけしてくれる
NeoBundle 'elzr/vim-json' " JSON用シンタックスハイライト系
NeoBundle 'othree/html5.vim' " ndlehtmlファイル編集
"Neobundle 'kien/ctrlp.vim'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle "h1mesuke/vim-alignta.vim"
NeoBundle 'The-NERD-tree'
NeoBundle 'taglist.vim'
NeoBundle 'https://github.com/wesleyche/SrcExpl.git'
NeoBundle 'https://github.com/wesleyche/Trinity.git'
NeoBundle 'glidenote/serverspec-snippets'

filetype plugin indent on     " required!
filetype indent on
syntax on

" {{{
"NeoBundle 'Shougo/vimproc', {
"      \ 'build' : {
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ }
"
""if has("lua")
""  NeoBundle 'Shougo/neocomplete', { 'autoload' : {
""        \   'insert' : 1,
""        \ }}
""else
""  NeoBundle 'Shougo/neocomplete', {
""        \ 'autoload' : {
""        \   'insert' : 1,
""        \ },
""        \ }
""endif
"
NeoBundle 'Shougo/neosnippet', {
      \ 'autoload' : {
      \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
      \   'filetypes' : 'snippet',
      \   'insert' : 1,
      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }}

NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

NeoBundle 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundle 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}

NeoBundle 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

"NeoBundle 'taka84u9/vim-ref-ri', {
"      \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
"      \ 'autoload': { 'filetypes': g:my.ft.ruby_files } }
"
"
NeoBundle 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['AlpacaTagsUpdate', 'AlpacaTagsSet', 'AlpacaTagsBundle']
      \ }}
" }}}



set runtimepath+=~/.vim/plugin
"syntax on
"filetype on
"filetype plugin indent on

" ----- start my settings -----
" [rubycomplete]
setlocal omnifunc=syntaxcomplete#Complete
"autocmd FileType ruby,eruby :set dictionary+=~/.vim/dict/snippetsEmu.dict
"autocmd FileType ruby  :set omnifunc=rubycomplete#CompleteRuby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" [tabs]
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb    set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb   set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml   set tabstop=2 shiftwidth=2
"au BufRead,BufNew * match JpSpace /　/

" [Encode]
set fileformats=unix,dos,mac " 改行コード
set encoding=utf-8 " デフォルトエンコーディング
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc  " ワイルドカードで表示するときに優先度を低くする拡張子

" [Rafe]
augroup BufferAu
  autocmd!
  au BufEnter * nnoremap K K
  au BufEnter *.rb nnoremap <silent> K :Refe <cword><CR>
augroup END

" [general]
set complete+=k                " 辞書ファイルを使用する設定に変更
set nocompatible
set history=30
set undolevels=10000
set smartindent                " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set autoindent                 " 自動でインデント
set scrolloff=5                " スクロール時の余白確保
set textwidth=0                " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                   " バックアップ取らない
set autoread                   " 他で書き換えられたら自動で読み直す
set noswapfile                 " スワップファイル作らない
set hidden                     " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
"set formatoptions=lmoq       " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                   " ビープをならさない
set browsedir=buffer           " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set showcmd                    " コマンドをステータス行に表示
set showmode                   " 現在のモードを表示
"set viminfo='50,<1000,s100,\u"50 " viminfoファイルの設定
set modelines=0                " モードラインは無効
set splitright                 " ウィンドウを縦分割すると、新しいウィンドウが現在のウィンドウの右に開かれる。
set splitbelow                 " ウィンドウを横分割すると、新しいウィンドウが現在のウィンドウの下に開かれる。
"set clipboard+=autoselect
set guioptions+=a
set guioptions-=T
" Ev/Rvでvimrcの編集と反映
"command! Ev edit $MYVIMRC
"command! Rv source $MYVIMRC

" [search]
set ignorecase
set smartcase
set wrapscan
set noincsearch
set hlsearch

" [UI]
colorscheme molokai
set t_Co=256
"set t_Co=255
set lcs=tab:>.,eol:$,trail:_,extends:\
set number            " 行番号表示
set ruler            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示
"set title
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set ts=2 sw=2 sts=0
set expandtab
set showcmd
set showmatch         " 括弧の対応をハイライト
set lazyredraw        " コマンド実行中は再描画しない
set ttyfast           " 高速ターミナル接続を行う

set formatoptions-=ro
autocmd FileType * set formatoptions-=ro

set formatoptions=q
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

set notitle
set noshowcmd
set laststatus=0
set statusline=""

" [Pmenu]
highlight Visual     ctermbg=lightgray
"highlight Pmenu      ctermbg=999999
"highlight PmenuSbar  ctermbg=Grey
"highlight PmenuSel   ctermbg=Blue
highlight linenr     ctermfg=Grey
highlight JpSpace    cterm=underline   ctermfg=Blue guifg=Blue
hi Pmenu ctermbg=lightgray ctermfg=black
hi PmenuSel ctermbg=blue ctermfg=white
hi PmenuSbar ctermbg=0 ctermfg=9

""highlight StatusLine term=NONE         cterm=NONE   ctermfg=black ctermbg=white
""highlight CursorLine cterm=underline
""highlight Normal     guifg=#F8F8F2 guibg=#1B1D1E

" [Srcexpl] tagsを利用したソースコード閲覧・移動補助機能
let g:SrcExpl_UpdateTags    = 1         " tagsをsrcexpl起動時に自動で作成（更新）
let g:SrcExpl_RefreshTime   = 0         " 自動表示するまでの時間(0:off)
let g:SrcExpl_WinHeight     = 0         " プレビューウインドウの高さ
let g:SrcExpl_RefreshMapKey = "<Space>" " 手動表示のMAP

" [Align] 整形補助
let g:Align_xstrlen = 3

" [yankling] yank履歴保持
"let g:yankling_window_height = 13

" [map]
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"nnoremap <silent><F11> :YRShow<CR>
map  <F12> :%Align
map  <F10> 50i*<Esc>
nnoremap <F11> iRAILS_DEFAULT_LOGGER.debug()<Esc>
"map  <F9> RAILS_<Esc>
"map  <F8> :SrcExplToggle<CR>
"map <silent> sy :call YanktmpYank()<CR>
"map <silent> sp :call YanktmpPaste_p()<CR>
"map <silent> sP :call YanktmpPaste_P()<CR>

imap <C-R> :call CTRL-R {0-9a-z"%#*:=}
"inoremap <F8> RAILS_DEFAULT_LOGGER.debug()
" 選択部分をクリップボードにコピー
vmap <C-C> "*y
" 挿入モード時、クリップボードから貼り付け
imap <C-V> <ESC>"*pa
" 選択部分をクリップボードの値に置き換え
vmap <C-V> d"*P


"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set matchtime=3       " 対応括弧のハイライト表示を3秒にする
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
" vを二回で行末まで選択
vnoremap v $h

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

imap <silent><C-F> <Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-U> <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F> <Plug>(neosnippet_expand_or_jump)

"------------------------------------
" vim-rails
"------------------------------------
""{{{
"有効化
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END
"}}}

set clipboard=unnamed,autoselect
"set noimdisableactivate

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;" . l:arg . "95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;"
endfunction

nnoremap s <Nop>
nnoremap sa :<C-u>CtrlP<Space>
nnoremap sb :<C-u>CtrlPBuffer<CR>
nnoremap sd :<C-u>CtrlPDir<CR>
nnoremap sf :<C-u>CtrlP<CR>
nnoremap sl :<C-u>CtrlPLine<CR>
nnoremap sm :<C-u>CtrlPMRUFiles<CR>
nnoremap sq :<C-u>CtrlPQuickfix<CR>
nnoremap ss :<C-u>CtrlPMixed<CR>
nnoremap st :<C-u>CtrlPTag<CR>

"autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec
"
"let g:neosnippet#snippets_directory = [
"      \'~/.vim/snippets',
"      \'~/.vim/bundle/serverspec-snippets',
"      \]
set mouse=
