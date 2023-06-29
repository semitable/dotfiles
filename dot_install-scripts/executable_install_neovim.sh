NEOVIM_VERSION=stable

# Install neovim
echo "[*] Installing neovim $NEOVIM_VERSION ..."
wget "https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/nvim-linux64.tar.gz" -O /tmp/nvim-linux64.tar.gz
mkdir -p ~/.local/bin
tar xf /tmp/nvim-linux64.tar.gz -C ~/.local
ln -sf $(readlink -f ~/.local/nvim-linux64/bin/nvim) ~/.local/bin/nvim

