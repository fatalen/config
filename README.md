# configuration files

- iosevka nerd font https://www.nerdfonts.com/font-downloads
- lazygit https://github.com/jesseduffield/lazygit
- yazi https://github.com/sxyazi/yazi
- fzf https://github.com/junegunn/fzf
- zoxide https://github.com/ajeetdsouza/zoxide

## stow
- links files from one directory to another directory
- documentation https://www.gnu.org/software/stow/
- install `sudo dnf install stow`
- link all to home folder `stow . -t ~`

## zsh
zsh https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
`sudo dnf install zsh`
sudo chsh $USER
/bin/zsh
logout
should autoload config from `~/.zshrc`
- zen config https://youtu.be/ud7YxC33Z3w?si=lt2ZeNUAumYaffnI
- plugin manager https://github.com/zdharma-continuum/zinit

## fedora
- disable update reminders `gsettings set org.gnome.software allow-updates false`
- system update `sudo dnf upgrade && sudo flatpak update && sudo fwupdmgr update`