
```bash
sudo apt install curl zsh git
chsh -s `which zsh`
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply semitable
zsh
```
