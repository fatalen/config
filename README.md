# configuration files
- my configuration (dotfiles) for macos

## 1. homebrew package manager
- install packages
```
curl -fsSL https://raw.githubusercontent.com/fatalen/config/main/brew/Brewfile | brew bundle --file=-

```

## 2. fish shell
- fish setup
```
$ fish
$ fish_add_path /opt/homebrew/bin
$ echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
$ chsh -s /opt/homebrew/bin/fish
```

## 3. alacritty terminal
- get themes
```
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```
- make symbolic link to configuration file
```
ln -s ~/dev/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
```

## 4. tmux multiplexer
- make symbolic link to configuration file
```
ln -s ~/dev/config/tmux/.tmux.conf ~/.tmux.conf
```

## 5. neovim editor

## 6. vscode editor
