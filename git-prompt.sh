cd () { builtin cd "$@" && chpwd; }
pushd () { builtin pushd "$@" && chpwd; }
popd () { builtin popd "$@" && chpwd; }
chpwd () {
  case $PWD in
    $HOME) HPWD="~";;
    $HOME/*/*) HPWD="${PWD#"${PWD%/*/*}/"}";;
    $HOME/*) HPWD="~/${PWD##*/}";;
    /*/*/*) HPWD="${PWD#"${PWD%/*/*}/"}";;
    *) HPWD="$PWD";;
  esac
}
PS1='$HPWD \$'

if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
	#PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\[\033[32m\]'       # change to green
	PS1="$PS1"'\u@\h '             # user@host<space>
	PS1="$PS1"'\[\033[35m\]'       # change to purple
	#PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
	PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
	#PS1="$PS1"'\w'                 # current working directory
	PS1="$PS1"'$HPWD'

	force_color_prompt=yes
	color_prompt=yes
	parse_git_branch() {
	 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
	}
	if [ "$color_prompt" = yes ]; then
	 PS1="$PS1"' \[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
	 #PS1="$PS1"'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
	else
	 PS1="$PS1"' \[\033[01;31m\]$(parse_git_branch)\$ '
	 #PS1="$PS1"'${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
	fi
	unset color_prompt force_color_prompt

	PS1="$PS1"'\[\033[0m\]'        # change color
	#PS1="$PS1"'\n'                 # new line
#	PS1="$PS1"'$ '                 # prompt: always $
fi

MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc
cd
