
```bash
sudo apt install curl zsh git
chsh -s `which zsh`
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply semitable
zsh
```
### For alacritty:
```bash
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 cargo
cargo install alacritty
```

### tmux:
```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
And ctrl+a and I (to install plugins)

### To make audio work:
```bash
sudo apt install pulseaudio-utils
```


### For rofi:
Visit [https://github.com/adi1090x/rofi](https://github.com/adi1090x/rofi).

### for i3lock:
I install i3lock-color: [https://github.com/Raymo111/i3lock-color](https://github.com/Raymo111/i3lock-color)
