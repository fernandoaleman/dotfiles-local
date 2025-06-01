autoload -U compinit && compinit

# create code directory if not exists
if [ ! -d ~/code ]; then
  mkdir -p ~/code
fi

# c shortcut to change to code path
unalias c >/dev/null 2>&1;
c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c
