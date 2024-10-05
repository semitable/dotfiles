# Dev category
if [[ "$INSTALL_DEV" == true ]]; then
  # neovim
  zinit as"program" wait'0' lucid light-mode nocompletions from'gh-r' \
    atload"export EDITOR=\`which nvim\` SUDO_EDITOR=\`which nvim\`; alias vim=nvim" \
    bpick'*linux*tar.gz' pick"nvim-linux64/bin/nvim" for \
    neovim/neovim

  # fzf
  zinit as"null" wait"0a" lucid light-mode from"gh-r" completions \
    sbin"fzf*" \
    dl'https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux' \
    dl'https://raw.githubusercontent.com/junegunn/fzf/488a236b7a4d01e910e0ac80b4794a7a054fb3a8/shell/completion.zsh -> _fzf' \
    dl'https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh' \
    dl'https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf-tmux.1 -> $ZPFX/man/man1/fzf-tmux.1' \
    dl'https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf.1 -> $ZPFX/man/man1/fzf.1' \
    src"key-bindings.zsh" \
  for @junegunn/fzf

  # rg
  zinit as"null" wait"0a" lucid light-mode from"gh-r" completions sbin for \
    sbin"**/rg" bpick'*x86_64-unknown-linux-musl*' BurntSushi/ripgrep

  # fd
  zinit as"null" wait"0a" lucid light-mode from"gh-r" completions sbin for \
    sbin"**/fd" @sharkdp/fd
fi

# Python/Conda category
if [[ "$INSTALL_MICROMAMBA" == true ]]; then
  # micromamba
  zinit as'program' wait'0a' lucid light-mode nocompletions from'gh-r' \
    atclone'./bin/micromamba shell hook --shell zsh --root-prefix $HOME/micromamba > zmicromamba.zsh' \
    atload"export MAMBA_EXE=\`which micromamba\`; export MAMBA_ROOT_PREFIX=$HOME/micromamba/" \
    bpick'micromamba-linux-64.tar.bz2' \
    pick'bin/micromamba' \
    src'zmicromamba.zsh' \
    for 'mamba-org/micromamba-releases'
fi

# Utils category
if [[ "$INSTALL_UTILS" == true ]]; then
  # jq
  zi for \
      from'gh-r' \
      sbin'* -> jq' \
      nocompile \
    @jqlang/jq

  # other bins
  zinit as"null" wait"0a" lucid light-mode from"gh-r" completions sbin for \
    sbin"eza" eza-community/eza \
    sbin"rbw" mv"completion/zsh -> completion/rbw" doy/rbw
fi

# Git Tools category
if [[ "$INSTALL_GIT_TOOLS" == true ]]; then
  zinit as"null" wait"0a" lucid light-mode from"gh-r" completions sbin for \
    atclone"mkdir completions; **/bin/gh completion -s zsh > completions/_gh" \
    sbin"**/gh" \
    cli/cli \
    sbin"lazygit" jesseduffield/lazygit
fi

# Backup Tools category
if [[ "$INSTALL_BACKUP_TOOLS" == true ]]; then
  zinit as"null" wait"0a" lucid light-mode from"gh-r" completions sbin for \
    sbin"restic" mv"restic* -> restic" \
    atclone"mkdir completions; ./restic generate --zsh-completion completions/_restic" \
    restic/restic \
    sbin"autorestic" mv"autorestic* -> autorestic" \
    atclone"mkdir completions; ./autorestic completion zsh > completions/_autorestic" \
    cupcakearmy/autorestic
fi

