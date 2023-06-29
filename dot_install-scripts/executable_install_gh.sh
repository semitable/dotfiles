GH_VERSION=2.31.0
echo "[*] Installing GitHub CLI v$GH_VERSION ..."
wget "https://github.com/cli/cli/releases/download/v$GH_VERSION/gh_${GH_VERSION}_linux_amd64.tar.gz" -O /tmp/gh-linux64.tar.gz
mkdir -p ~/.local/bin
tar xf /tmp/gh-linux64.tar.gz -C ~/.local
ln -sf $(readlink -f ~/.local/gh_${GH_VERSION}_linux_amd64/bin/gh) ~/.local/bin/gh

