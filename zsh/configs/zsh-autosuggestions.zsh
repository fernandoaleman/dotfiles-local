if command -v brew >/dev/null; then
  if brew list | { grep -Fq zsh-autosuggestions; cat > /dev/null; } then
    source "$(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  fi
fi
