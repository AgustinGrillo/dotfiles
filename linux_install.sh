# Deprecated:
# openbox, obconf, lxpolkit (policykit-1-gnome), clipit

# TODO:
# xbacklight -> brightnessctl or light
# clipit -> copyq

# Useful links:
# xbacklight: https://askubuntu.com/questions/715306/xbacklight-no-outputs-have-backlight-property-no-sys-class-backlight-folder
# networkmanager-dmenu: https://stackoverflow.com/questions/59389831/cannot-import-name-gi
# playerctl: https://askubuntu.com/questions/1080671/how-can-i-install-playerctl

set -euo pipefail

# Install dependencies
APT_PKGS=(
	git curl stow python3-pip
	nitrogen scrot xclip lxappearance nautilus rofi kitty zsh dunst tint2 redshift
	tmux xbacklight dmenu imagemagick x11-xserver-utils xautolock xfce4-power-manager
	gawk perl sed
	playerctl pulseaudio pavucontrol zathura batcat vim neovim picom alsa-utils
	wireless-tools xinput arandr autorandr
	i3-wm i3lock
)
PIP_PKGS=(ydiff)

echo "Installing apt packages"
sudo apt-get update
sudo apt-get install -y "${APT_PKGS[@]}"

echo "Installing pip packages"
if [[ ${#PIP_PKGS[@]} -gt 0 ]]; then
	if command -v python3 >/dev/null 2>&1; then
		python3 -m pip install --user --upgrade pip setuptools wheel
		python3 -m pip install --user "${PIP_PKGS[@]}"
	else
		echo "python3 not found; skipping pip package installs."
	fi
fi

echo "Installing Neovim"
# TODO

echo "Installing oh-my-zsh"
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
if [[ -d "$OH_MY_ZSH_DIR" ]]; then
	echo "oh-my-zsh already present at $OH_MY_ZSH_DIR; skipping."
else
	echo "=== Installing oh-my-zsh (non-interactive) ==="
	# RUNZSH=no -> don't auto-run zsh after install; CHSH=no -> don't change default shell
	RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Installing TPM"
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [[ -d "$TPM_DIR" ]]; then
	echo "tpm already cloned at $TPM_DIR; skipping clone."
else
	echo "=== Cloning tpm (tmux plugin manager) ==="
	git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "Installing nerd font"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Monaspace.zip"
FONT_DEST="${HOME}/.local/share/fonts"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

mkdir -p "$FONT_DEST"
if command -v curl >/dev/null 2>&1; then
  curl -fL "$FONT_URL" -o "$TMP/font.zip"
else
  wget -q -O "$TMP/font.zip" "$FONT_URL"
fi

unzip -o "$TMP/font.zip" -d "$FONT_DEST"
fc-cache -f "$FONT_DEST"
echo "Fonts installed to $FONT_DEST"


echo "Symlinking dotfiles"
mkdir ~/screensaver
stow i3 nvim kitty tmux vim xresources zsh
stow bat dunst lazygit networkmanager-dmenu nitrogen redshift rofi walls zathura general_scripts

echo "Done."
