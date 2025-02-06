# configuration files
- my configuration (dotfiles) for macos

## homebrew package manager
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

## ghostty terminal
- simlink configuration file
```
mkdir -p ~/.config/ghostty
ln -s ~/git/config/ghostty/config ~/.config/ghostty/config
```

## neovim text editor
- install lazyVim https://github.com/LazyVim/LazyVim?tab=readme-ov-file#-getting-started
- lazyVim healthCheck
```
:q LazyHealth
```
