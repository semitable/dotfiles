
```bash
sudo apt install curl zsh git
chsh -s `which zsh`
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply semitable
zsh
```
For alacritty:
```bash
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 cargo
cargo install alacritty
```
