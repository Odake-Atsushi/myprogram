########################
# 自分の環境を構築する #
########################

sed -i -e 's/main/main contrib non-free/g' /etc/apt/sources.list

echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
##echo "# stable" >> /etc/apt/sources.list
##echo "deb http://deb.debian.org/debian/ stable main contrib non-free" >> /etc/apt/sources.list
##echo "deb-src http://deb.debian.org/debian/ stable main contrib non-free" >> /etc/apt/sources.list
##echo "" >> /etc/apt/sources.list
##echo "deb http://security.debian.org/debian-security stable/updates main contrib non-free" >> /etc/apt/sources.list
##echo "deb-src http://security.debian.org/debian-security stable/updates main contrib non-free" >> /etc/apt/sources.list
##echo "" >> /etc/apt/sources.list
##echo "# buster-updates, previously known as 'volatile'" >> /etc/apt/sources.list
##echo "deb http://deb.debian.org/debian/ stable-updates main contrib non-free" >> /etc/apt/sources.list
##echo "deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free" >> /etc/apt/sources.list
##echo "" >> /etc/apt/sources.list
##echo "" >> /etc/apt/sources.list
echo "# testing" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ testing main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ testing main contrib non-free" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "# unstable" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ unstable main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ unstable main contrib non-free" >> /etc/apt/sources.list


apt update
apt -y upgrade
apt -y autopurge

apt -y install --no-install-recommends \
	sway swaybg swayidle swaylock xwayland rxvt-unicode \
	firefox-l10n-ja fonts-noto-cjk fonts-ricty-diminished \
	fontconfig nnn wofi htop bash-completion deborphan \
	i3status manpages-ja manpages-ja-dev wdisplays
apt -y install \
	man fcitx5-mozc fcitx5 pulseaudio pamix network-manager \
	bluez brightnessctl #live-build task-japanese
apt -y purge im-config

# buster ===============================
apt -y purge \
	linux-image-4.19.0-10-amd64 \
	gcc-8-base
sed -i -e 's/buster/stable/g' /etc/apt/sources.list
#=======================================

apt update
apt -y upgrade
apt -y autopurge
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt -y autopurge $(deborphan --guess-all)
apt update
apt -y upgrade
apt -y autopurge
apt -y clean

# /etc/environment japanese input ======
echo "#fcitx settings" >> /etc/environment
echo "#export DefaultIMModule=fcitx5" >> /etc/environment
echo "export INPUT_METHOD=fcitx5" >> /etc/environment
echo "export XMODIFIERS=fcitx5" >> /etc/environment
echo "export GTK_IM_MODULE=fcitx5" >> /etc/environment
echo "export QT_IM_MODULE=fcitx5" >> /etc/environment

# .bashrc ==============================

echo "" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "alias rm='rm -i'" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "alias mv='mv -i'" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "alias cp='cp -i'" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "alias ll='ls -lah --color=auto'" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "export LESS='-R'" |tee -a /etc/skel/.bashrc ~/.bashrc
echo "export EDITOR=nano" |tee -a /etc/skel/.bashrc ~/.bashrc
chmod 644 ~/.bashrc

# .bash_profile ========================
echo "#if running from tty1 start sway" |tee -a /etc/skel/.bash_profile ~/.bash_profile
echo "" |tee -a /etc/skel/.bash_profile ~/.bash_profile
echo 'if [ "$(tty)" = "/dev/tty1" ]; then' |tee -a /etc/skel/.bash_profile ~/.bash_profile
echo "        exec sway" |tee -a /etc/skel/.bash_profile ~/.bash_profile
echo "else" |tee -a /etc/skel/.bash_profile ~/.bash_profile
echo "        LANG=C" |tee -a /etc/skel/.bash_profile ~/.bash_profile
echo "fi" |tee -a /etc/skel/.bash_profile ~/.bash_profile
chmod 644 ~/.bash_profile

# .config/sway/config
mkdir -p ~/.config/sway
cp sway-config.config ~/.config/sway/config
chmod 644 ~/.config/sway/config
