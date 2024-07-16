# configuration files

## 1. brew
```
curl -fsSL https://raw.githubusercontent.com/fatalen/config/main/brew/Brewfile | brew bundle --file=-

```

## 2. alacritty
- get themes
```
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```
- make symbolic link to configuration file
```
ln -s ~/dev/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
```
