RBW_VERSION=1.9.0
echo "[*] Installing RBW CLI v$RBW_VERSION ..."
wget "https://github.com/doy/rbw/releases/download/$RBW_VERSION/rbw_${RBW_VERSION}_linux_amd64.tar.gz" -O /tmp/rbw-linux64.tar.gz
mkdir -p ~/.local/bin
tar xf /tmp/rbw-linux64.tar.gz -C ~/.local/bin
rm -rf ~/.local/bin/completion
rm /tmp/rbw-linux64.tar.gz
