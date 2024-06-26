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
