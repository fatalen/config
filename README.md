# configuration files
- my configuration (dotfiles)

## homebrew package manager (mac only)
- install homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- install packages
```
curl -fsSL https://raw.githubusercontent.com/fatalen/config/main/brew/Brewfile | brew bundle --file=-

```

## zsh shell
- zsh setup
```
ln -s ~/git/config/zsh/.zshrc ~/.zshrc
```

## wezterm terminal
- simlink configuration file
```
ln -s ~/git/config/wezterm/.wezterm.lua ~/.wezterm.lua
```

## neovim text editor
- install lazyVim https://github.com/LazyVim/LazyVim?tab=readme-ov-file#-getting-started
- lazyVim healthCheck
```
:q LazyHealth
```
