if command -v brew >/dev/null; then
  if brew list | { grep -Fq zsh-syntax-highlighting; cat > /dev/null; } then
    source "$(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  fi
fi
