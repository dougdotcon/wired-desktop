# wired — phosphor prompt. no extra process, safe on this Atom.
case "$TERM" in
  xterm*|rxvt*|screen*|tmux*|linux)
    PS1='\[\e]0;wired // \w\a\]\[\033[32m\]wired\[\033[0m\] \[\033[1;32m\]\u@\h\[\033[0m\] \[\033[36m\]\w\[\033[32m\]\n❯\[\033[0m\] '
    ;;
esac
if [ -t 1 ]; then
  printf '\033[32m%s\033[0m\n' 'present day, present time'
  printf '\033[36m%s\033[0m\n' 'wired  ·  debian 13  ·  the wired is open'
fi
