fpath=(/usr/local/share/zsh-completions $fpath)

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin/:$HOME/bin:$PATH
export PATH=~/go/bin:$PATH
export GOPATH=~/go

export HISTFILE=~/.zsh_history
# osx alias
alias pbc='pbcopy'
# Terminal Colorの設定
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# vim
#export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export EDITOR=vim
#alias vim=/usr/local/bin/vim

# Color
#
#DEFAULT=$'%{\e[1;0m%}'
#RESET="%{${reset_color}%}"
##GREEN=$'%{\e[1;32m%}'
#GREEN="%{${fg[green]}%}"
##BLUE=$'%{\e[1;35m%}'
#BLUE="%{${fg[blue]}%}"
#RED="%{${fg[red]}%}"
#CYAN="%{${fg[cyan]}%}"
#WHITE="%{${fg[white]}%}"
# 直前のコマンドの終了ステータスが0以外のときは赤くする。
# ${MY_MY_PROMPT_COLOR}はprecmdで変化させている数値。
#local MY_COLOR="$ESCX"'%(0?.${MY_PROMPT_COLOR}.31)'m
#local NORMAL_COLOR="$ESCX"m

# 色付きで補完する
zstyle ':completion:*' list-colors di=34 fi=0

# エラーメッセージ本文出力に色付け
e_normal=`echo -e "\033[0;30m"`
e_RED=`echo -e "\033[1;31m"`
e_BLUE=`echo -e "\033[1;36m"`

export EDITOR=vim
#export PATH=$PATH:$HOME/local/bin:/usr/local/git/bin
#export PATH=$PATH:$HOME/dotfiles/bin
#export PATH=$PATH:/sbin:usr/local/bin
#export PATH=$PATH:/usr/bin
#export PATH=$PATH:/usr/bin

#screenのローカル保存設定
#export SCREENDIR=/home/USER/.screens
#export SCREENDIR=/home/owner/.screens

LISTMAX=1000                      # 補完リストを尋ねる数 (1=黙って表示, 0=ウィンドウから溢れるときは尋ねる)

#---- 補完 ---------------#
autoload -U compinit
compinit -u
#compinit

# 補完の時に大文字小文字を区別しない (但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 一部のコマンドライン定義は、展開時に時間のかかる処理を行う -- apt-get, dpkg (Debian), rpm (Redhat), urpmi (Mandrake), perlの-Mオプション, bogofilter (zsh 4.2.1以降), fink, mac_apps (MacOS X)(zsh 4.2.2以降)
zstyle ':completion:*' use-cache true
# 補完候補を ←↓↑→ で選択 (補完候補が色分け表示される)
zstyle ':completion:*:default' menu select=1
# 補完候補を ←↓↑→ で選択 (補完候補が色分け表示される)
#zstyle ':completion:*:default' menu select true
# オプション補完で解説部分を表示しない
#zstyle :completion:* verbose no
#
# カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補
zstyle ':completion:*:cd:*' tag-order local-directories path-directories


# 特定のコマンドの補完を無効にする
#compdef -d w3m
# あるコマンドの補完を他のコマンドのように補完する (platex も latex と同じ)
compdef _tex platex

#---- zmv ---------------#
# autoload -U zmv
# # % zmv '(*).jpeg' '$1.jpg'
# # % zmv '(**/)foo(*).jpeg' '$1bar$2.jpg'
# # % zmv -n '(**/)foo(*).jpeg' '$1bar$2.jpg' # 実行せずパターン表示のみ
# # % zmv '(*)' '${(L)1}; # 大文字→小文字
# # % zmv -W '*.c.org' 'org/*.c' #「(*)」「$1」を「*」で済ませられる
# alias mmv='noglob zmv -W'  # 引数のクォートも面倒なので
# # % mmv *.c.org org/*.c
# #zmv -C # 移動ではなくコピー(zcp として使う方法もあるみたいだけど)
# #zmv -L # 移動ではなくリンク(zln として使う方法もあるみたいだけど)

# 履歴による予測入力 (man zshcontrib)
#autoload -U predict-on
#zle -N predict-on
#zle -N predict-off
#bindkey '^xp' predict-on
#bindkey '^x^p' predict-off

# core抑制
#unlimit
#limit core 0
#limit -s
limit   coredumpsize    0

#####################################################################
# key bindings
#####################################################################
# 端末設定
#stty    erase   '^H'        # Ctrl+H に 1 文字削除
#stty    intr    '^C'        # Ctrl+C に割り込み
#stty    susp    '^Z'        # Ctrl+Z にサスペンド

# zsh のキーバインド (EDITOR=vi かでも判断)
bindkey -e    # emacs 風
#bindkey -v     # vi 風
#zle-line-init() { zle -K vicmd; } ; zle -N zle-line-init # 初期状態をコマンドモード
#bindkey "^?" backward-delete-char

# カーソル位置から前方削除
# override kill-whole-line
#bindkey '^U' backward-kill-line
#bindkey '^A' beginning-of-line
#bindkey '^E' end-of-line

# 履歴検索 = C-p,n で検索・補完
#autoload -U history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end
#bindkey '^P' history-beginning-search-backward
#bindkey '^N' history-beginning-search-forward

# history incremental search
#bindkey "^R" history-incremental-search-backward
#bindkey "^S" history-incremental-search-forward

# ワイルドカードの展開を確認
#bindkey "^X" expand-word
# ヘルプの表示
bindkey "^B" run-help
# run-help が呼ばれた時、zsh の内部コマンドの場合は該当する zsh のマニュアル表示
[ -n "`alias run-help`" ] && unalias run-help
autoload run-help


# ls /usr/local/etc などと打っている際に、C-w で単語ごとに削除
# default  : ls /usr/local → ls /usr/ → ls /usr → ls /
# この設定 : ls /usr/local → ls /usr/ → ls /
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'


#####################################################################
# functions
#####################################################################
setopt prompt_subst          # プロンプトに escape sequence (環境変数) を通す
unsetopt promptcr            # 改行のない出力をプロンプトで上書きするのを防ぐ
autoload -U colors        # プロンプトのカラー表示を有効
colors                    # → 色指定  $fg[色名]/$bg[色名]/$reset_color (${, $} で囲む必要がある)
                          #            30黒 31赤 32緑 33黄 34青 35紫 36水 37白

#setopt extended_history      # 履歴ファイルに開始時刻と経過時間を記録
unsetopt extended_history
setopt append_history        # 履歴を追加 (毎回 .zhistory を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt share_history         # 履歴の共有
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_space     # スペースで始まるコマンド行はヒストリリストから削除
                             # (→ 先頭にスペースを入れておけば、ヒストリに保存されない)
unsetopt hist_verify         # ヒストリを呼び出してから実行する間に一旦編集可能を止める
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
setopt hist_save_no_dups     # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する。
setopt hist_no_store         # historyコマンドは履歴に登録しない

setopt hist_expand           # 補完時にヒストリを自動的に展開
setopt list_packed           # コンパクトに補完リストを表示
#setopt auto_remove_slash     # 補完で末尾に補われた / を自動的に削除
unsetopt auto_remove_slash
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
unsetopt menu_complete       # 補完の際に、可能なリストを表示してビープを鳴らすのではなく、
                             # 最初にマッチしたものをいきなり挿入、はしない
setopt auto_list             # ^Iで補完可能な一覧を表示する(補完候補が複数ある時に、一覧表示)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt auto_resume           # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム

#setopt auto_correct          # 補完時にスペルチェック
#setopt correct               # スペルミスを補完
#setopt correct_all           # コマンドライン全てのスペルチェックをする
#setopt AUTOLOGOUT=n          # n分後に自動的にログアウト

setopt auto_cd               # ディレクトリのみで移動
setopt no_beep               # コマンド入力エラーでBeepを鳴らさない
#setopt beep
setopt brace_ccl             # ブレース展開機能を有効にする
setopt bsd_echo
setopt complete_in_word
setopt equals                # =COMMAND を COMMAND のパス名に展開
setopt extended_glob         # 拡張グロブを有効にする
unsetopt flow_control        # (shell editor 内で) C-s, C-q を無効にする
setopt no_flow_control       # C-s/C-q によるフロー制御を使わない
setopt hash_cmds             # 各コマンドが実行されるときにパスをハッシュに入れる
setopt no_hup                # ログアウト時にバックグラウンドジョブをkillしない
#setopt ignore_eof            # C-dでログアウトしない
#setopt no_checkjobs          # ログアウト時にバックグラウンドジョブを確認しない

setopt long_list_jobs        # 内部コマンド jobs の出力をデフォルトで jobs -L にする
setopt magic_equal_subst     # コマンドラインの引数で --PREFIX=/USR などの = 以降でも補完できる
setopt mail_warning
setopt multios               # 複数のリダイレクトやパイプなど、必要に応じて TEE や CAT の機能が使われる
setopt numeric_glob_sort     # 数字を数値と解釈してソートする
setopt path_dirs             # コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt print_eight_bit       # 補完候補リストの日本語を適正表示
setopt short_loops           # FOR, REPEAT, SELECT, IF, FUNCTION などで簡略文法が使えるようになる

setopt auto_name_dirs
#setopt sun_keyboard_hack     # SUNキーボードでの頻出 typo ` をカバーする
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt cdable_vars sh_word_split

setopt auto_pushd            # 普通に cd するときにもディレクトリスタックにそのディレクトリを入れる
setopt pushd_ignore_dups     # ディレクトリスタックに重複する物は古い方を削除
setopt pushd_to_home         # pushd 引数ナシ == pushd $HOME
setopt pushd_silent          # pushd,popdの度にディレクトリスタックの中身を表示しない

#setopt rm_star_wait          # rm * を実行する前に確認
setopt rm_star_silent        # rm * を実行する前に確認しない
setopt notify                # バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる

#setopt no_clobber            # リダイレクトで上書きを禁止
unsetopt no_clobber
setopt no_unset              # 未定義変数の使用禁止
#setopt interactive_comments  # コマンド入力中のコメントを認める
#setopt chase_links           # シンボリックリンクはリンク先のパスに変換してから実行
#setopt print_exit_value      # 戻り値が 0 以外の場合終了コードを表示
#setopt single_line_zle       # デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる
#setopt xtrace                # コマンドラインがどのように展開され実行されたかを表示する
setopt HIST_IGNORE_DUPS

# カレントディレクトリ中にサブディレクトリが無い場合に cd が検索するディレクトリのリスト
cdpath=($HOME)
# zsh関数のサーチパス
#fpath=($fpath ~/.zfunc )

#####################################################################
#####################################################################
# functions
#####################################################################
#-------------------------------------------------------
# cd && ls
#function cd() {builtin cd $@ && ls -aF --show-control-char --color=auto}
function cd () {               # ファイルを探して、そのファイルのある場所にcd
    if [ $# = 0 ]; then        #    % locate something.c
        builtin cd             #        /usr/local/.../something.c
    elif [ -f $1 ]; then       #    % cd `!!`
        builtin cd $1:h
    else
        builtin cd $*
    fi
    ls -aF --show-control-char --color=auto
}
# aliases
#####################################################################
# ゴミ箱
#alias rm='trash'
#alias trash-look='ls -al ~/.trash-dir/ 2> /dev/null'
#alias trash-clean='\rm -rf ~/.trash-dir/* 2> /dev/null'

# common
alias del='rm -rf'
alias cp='cp -irf'
alias mv='mv -i'
alias ..='cd ..'
alias pd="pushd"
alias po="popd"
alias eng='LANG=C LANGUAGE=C LC_ALL=C'
alias zcompile='zcompile ~/.zshrc'

# よく間違えるもの
alias dc='cd'
alias bc='cd'

#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias cl='clear'
#alias dircl='eval `dircolors ~/.dir_colors -b`'  ## for RedHat (FedoraCore)
alias q='exit';
alias e='exit';
alias quit='exit';

alias kon='modprobe -q vga16fb; modprobe -q fbcon; jfbterm';
alias jfbterm='LANG=ja_JP.eucJP /usr/bin/jfbterm'

# IEEE paper
alias mydvips='dvips -Ppdf -G0 -tletter'
alias myps2pdf='ps2pdf -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sPAPERSIZE=letter'

# TeX -> eps
alias pictex='dvips -Ppdf -E -D 600 -Z'

# application
# vi
#alias vi='vi -i NONE'
alias vi='vim'
alias v='vim'
alias via='vi ~/.bashrc'
alias seta='source ~/.bashrc'
alias gq='gqview'
alias howm='vim -c Howm'
alias cha='vim -c Changelog'

# midnight commander
alias mc='mc -da'

# grep 行数, 再帰的, ファイル名表示, 行数表示, バイナリファイルは処理しない
alias grep='grep -r --color=auto'
#alias grep='grep -r'

# development
alias py='python'
alias gdb='gdb -silent'
alias gpp='g++'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"' # AUTO_PUSHD が必要
# dirs -v  --  ディレクトリスタックを表示

# グローバルエイリアス
alias -g G='| grep '  # e.x. dmesg lG CPU
alias -g L='| $PAGER '
alias -g W='| wc'
alias -g H='| head'
alias -g T='| tail'

# 個人設定
alias e='exit'
alias di='diff'
alias python='/usr/local/bin/python3'

if [ -f ~/.dir_colors ]; then
   eval `dircolors -b ~/.dir_colors`
fi
# ls
eval $(dircolors ~/.dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
alias ls='ls --color=auto'
alias la='ls -al'
alias ll='ls -l'

# subversion
alias svnst='svn st |grep -v "外部"|grep " "'
alias sudo='sudo env PATH=$PATH'

setopt autopushd
setopt prompt_subst

## 補完候補の色づけ
#eval `dircolors`
#export LSCOLORS=gxfxxxxxcxxxxxxxxxxxxx

#export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;36:cd=43;36:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#export ZLS_COLORS=$LS_COLORS
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

############ ruby ###########
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

alias ls='ls -GF'

autoload colors
colors
#case ${UID} in
#  0)
#    PROMPT="%B%{${fg[white]}%}%/#%{${reset_color}%}%b "
#    PROMPT2="%B%{${fg[white]}%}%_#%{${reset_color}%}%b "
#    SPROMPT="%B%{${fg[white]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#    ;;
#  *)
#    PROMPT="%{${fg[white]}%}%/%%%{${reset_color}%} "
#    PROMPT2="%{${fg[white]}%}%_%%%{${reset_color}%} "
#    SPROMPT="%{${fg[white]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#    #[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#    #    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#    #;;
#esac

# set terminal title including current directory
#
#case "${TERM}" in
#  kterm*|xterm*)
#    precmd() {
#      echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
#    }
#    export LSCOLORS=exfxcxdxbxegedabagacad
#    #    export LSCOLORS=gxfxcxdxbxegedabagacad
#    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#    zstyle ':completion:*' list-colors \
#      'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#    ;;
#esac

export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#PROMPT='%B%{${fg[red]}%} $PS1_USER%{${fg[green]}%}@$(cat /var/run/ip_addr)${WINDOW:+":$WINDOW"}]%{%(?.$fg[yellow].$fg[red])%}%(!.#.$)%{${reset_color}%}%b '
#export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#alias ls='ls -1 --color=auto'
alias st="status"
alias gitst='git st'

# tmux
#alias tmux='tmuxx'
#alias tm='tmuxx'
#alias tma='tmuxx attach'
#alias tml='tmuxx list-window'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_param_slash
#alias cd='pushd'
alias bd='popd'

# カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補に出す
zstyle ':completion:*:cd:*' tag-order local-directories path-directories

# ホスト毎にホスト名の部分の色を作る http://absolute-area.com/post/6664864690/zsh

#local LEFTC=$'%{\e[38;5;30m%}'
#local RIGHTC=$'%{\e[38;5;88m%}'
#local DEFAULTC=$'%{\e[m%}'
#export PROMPT=$LEFTC"%U$USER%%%u "$DEFAULTC
#export RPROMPT=$RIGHTC"[%~]"$DEFAULTC
#local HOSTCOLOR=$'%{['"$(printf "%d\n" 0x$(hostname|md5sum|cut -c1-2))"'m%}'
#local USERCOLOR=$'%{['"$(printf "%d\n" 0x$(echo $USERNAME|md5sum|cut -c1-2))"'m%}'
#PROMPT="%{${fg[white]}%}> %1(v|%{${fg[green]}%}%1v|)%{${fg[yellow]}%}%d%{${reset_color}%}"
#case ${UID} in
#0)
#  # rootの場合は赤くする
#  PROMPT=$PROMPT"%{${fg[red]}%}[%n@%f$HOSTCOLOR%m%{${fg[red]}%}]%{${reset_color}%} "
#  ;;
#*)
#  # root以外の場合は緑
#  PROMPT=$PROMPT"%{${fg[green]}%}[$USERCOLOR%n%{${fg[green]}%}@%f$HOSTCOLOR%m%{${fg[green]}%}]%{${reset_color}%} "
#  ;;
#esac
##RPROMPT='%{[1;31m%}$df%{[0;37m%}'

alias diff='colordiff -u'
colors=(
    ## 気に入らない色はコメントアウト
    # $'%{\e[0;30m%}' # black
    $'%{\e[0;31m%}' # red
    $'%{\e[0;32m%}' # green
    $'%{\e[0;33m%}' # brown
    $'%{\e[0;34m%}' # blue
    $'%{\e[0;35m%}' # purple
    $'%{\e[0;36m%}' # cyan
    # $'%{\e[0;37m%}' # gray

    ## light colors
    # $'%{\e[1;30m%}' # black
    $'%{\e[1;31m%}' # red
    $'%{\e[1;32m%}' # green
    $'%{\e[1;33m%}' # brown
    $'%{\e[1;34m%}' # blue
    $'%{\e[1;35m%}' # purple
    $'%{\e[1;36m%}' # cyan
    # $'%{\e[1;37m%}' # gray
)
colored_user=$colors[$((`echo "$USER" | sum | cut -f1 -d' '`%${#colors}))+1]$USER
colored_host=$colors[$((`echo "$HOST" | sum | cut -f1 -d' '`%${#colors}))+1]$HOST
PROMPT="[$colored_user"$'%{\e[1;0m%}'"@$colored_host"$'%{\e[1;0m%}'"]%~# "


#---------------------------------------------------------------------------
# Prompt
#---------------------------------------------------------------------------
#case ${UID} in
#0)
#    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %{${fg[red]}%}%n@%m%#%{${reset_color}%} "
#    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#    RPROMPT="%{${fg[green]}%}[%~:%T]%{${reset_color}%}"
#    ;;
#*)
#    PROMPT="%{${fg[red]}%}%n@%m%%%{${reset_color}%} "
#    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#    RPROMPT="%{${fg[green]}%}[%~:%T]%{${reset_color}%}"
#    #PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#    ;;
#esac
#
#local HOSTC=$'%{\e[38;5;'"$(printf "%d\n" 0x$(hostname|md5sum|cut -c1-2))"'m%}'
#local DEFAULTC=$'%{\e[m%}'
#RPROMPT=$HOSTC'%S[%M]%s'$DEFAULTC


#補完機能を使用する
autoload -U compinit promptinit
compinit
zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1

#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#補完でカラーを使用する
autoload colors
#zstyle ':completion:*' list-colors "${LS_COLORS}"

#kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

#コマンドにsudoを付けても補完
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

fpath=(~/zsh-completions/src $fpath)
#export PATH=/usr/local/lib/cw:$PATH

#zle_highlight=(default:fg=blue isearch:bold,fg=red)
#highlight_first_five_characters() {
#  region_highlight=('0 5 bold,fg=red')
#}
#zle -N highlight_first_five_characters
#bindkey '^T'  highlight_first_five_characters
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#
#${ZSH_HIGHLIGHT_STYLES[bracket-error]:=fg=blue,bold}
bindkey -d  # いったんキーバインドをリセット
bindkey -e  # emacsモードで使う
alias diff='colordiff -u'
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

eval $(dircolors ~/.dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
alias ls='ls --color=auto'
alias la='ls -al'
alias ll='ls -l'


export PGDATA="/usr/local/var/postgres"

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    date
    hostname
    pwd
    ls
    # ↓おすすめ
    # ls_abbrev
    #if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    #    echo
    #    echo -e "\e[0;33m--- git status ---\e[0m"
    #    git status -sb
    #fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^X' do_enter

export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history

zstyle ':completion:*:default' menu select=2
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#
#export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
#export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
#zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'


############## man ##############
export LESS='-g -i -M -R -S -z-4 -x4'
export PAGER=less

#export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
#export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
#export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
#export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
#export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
#export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
#export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

export LESS_TERMCAP_mb=$(printf "\e[1;31m")      # Begins blinking.
export LESS_TERMCAP_md=$(printf "\e[1;31m")      # Begins bold.
export LESS_TERMCAP_me=$(printf "\e[0m")         # Ends mode.
export LESS_TERMCAP_se=$(printf "\e[0m")         # Ends standout-mode.
export LESS_TERMCAP_so=$(printf "\e[00;47;30m")  # Begins standout-mode.
export LESS_TERMCAP_ue=$(printf "\e[0m")         # Ends underline.
export LESS_TERMCAP_us=$(printf "\e[1;32m")      # Begins underline.

if [ -e $(which src-hilite-lesspipe.sh) ]; then
  export LESSOPEN="| $(which src-hilite-lesspipe.sh) %s"
fi
#export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'

#source ~/git/git-completion.bash
#source ~/git/git-prompt.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ageagekun/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/ageagekun/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ageagekun/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/ageagekun/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

function peco-history-selection() {
  #BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
  CURSOR=$#BUFFER
  #zle reset-prompt
  zle -R -c
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# Ctrl+Wをスラッシュ等区切りへ
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
