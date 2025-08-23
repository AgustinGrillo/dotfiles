# openbox, obconf, nitrogen, scrot, xclip, lxappereance, nautilus, python-nautilus, rofi, kitty, zsh, oh-my-zsh, dunst, tint2, redshift, tmux, [tpm](https://github.com/tmux-plugins/tpm), xbacklight ([link](https://askubuntu.com/questions/715306/xbacklight-no-outputs-have-backlight-property-no-sys-class-backlight-folder) for possible bug), dmenu, Imagemagick, xset, xautolock, xfce4-power-manager, clipit, lxpolkit, [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu) (with repspective requirements; [link](https://stackoverflow.com/questions/59389831/cannot-import-name-gi) for possible bug), [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth), awk, perl, sed, [playerctl](https://github.com/altdesktop/playerctl) (useful [link](https://askubuntu.com/questions/1080671/how-can-i-install-playerctl)), gedit, gedit-plugins, spotify, pulseaudio volume control, neofetch (≥v7.0), zathura, [bat](https://github.com/sharkdp/bat), vim, neovim (≥v0.7), [picom](https://github.com/yshui/picom), ydiff (install via pip), alsa-utils, wireless-tools, xinput, xrandr, arandr, autorandr. i3-wm, i3lock

# Create softlinks to dotfiles.
ln -sf ~/Documents/dotfiles/.zshrc ~/.zshrc
ln -sf ~/Documents/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/Documents/dotfiles/.Xresources ~/.Xresources
rm -r ~/.vim
ln -sfd ~/Documents/dotfiles/.vim ~/.vim 
rm -r ~/nvim
ln -sfd ~/Documents/dotfiles/.config/nvim ~/.config/nvim 
ln -sfd ~/Documents/dotfiles/.themes/Bleu\ Foncé  ~/.themes/Bleu\ Foncé 
ln -sf ~/Documents/dotfiles/.local/bin/networkmanager_dmenu ~/.local/bin/networkmanager_dmenu 
ln -sf ~/Documents/dotfiles/.local/bin/rofi-bluetooth ~/.local/bin/rofi-bluetooth 
ln -sfd ~/Documents/dotfiles/.local/bin/scripts ~/.local/bin/scripts 
ln -sfd ~/Documents/dotfiles/.local/share/fonts ~/.local/share/fonts
ln -sfd ~/Documents/dotfiles/.local/share/gedit ~/.local/share/gedit
ln -sfd ~/Documents/dotfiles/.icons  ~/.icons  
tar -xf ~/.icons/cherry.tar.gz -C ~/.icons
rm -r ~/.config/bat ~/.config/dunst ~/.config/kitty ~/.config/neofetch ~/.config/networkmanager-dmenu ~/.config/nitrogen ~/.config/openbox ~/.config/redshift ~/.config/rofi ~/.config/tint2 ~/.config/zathura 
ln -sfd ~/Documents/dotfiles/.config/*  ~/.config 
ln -sfd ~/Documents/dotfiles/walls  ~/walls
mkdir ~/screensaver
ln -sf ~/Documents/dotfiles/Oblivion-dark.Xresources  ~/Oblivion-dark.Xresources 
ln -sfd ~/Documents/dotfiles/.local/share/nautilus-python ~/.local/share/nautilus-python 
chmod +x ~/Documents/dotfiles/.local/share/nautilus-python/extensions/open-kitty.py
ln -sf ~/Documents/dotfiles/.config/lazygit/config.yml ~/.config/lazygit/config.yml
