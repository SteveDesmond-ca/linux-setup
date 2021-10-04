#!/usr/bin/env bash

apt update
apt full-upgrade -y
sudo apt-get install -y \
	apt-transport-https \
	wget \

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
rm -f packages.microsoft.gpg

wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

curl -fsSL https://deb.nodesource.com/setup_current.x | bash -

apt update -y
apt install -y \
	code \
	dotnet-sdk-3.1 \
	dotnet-sdk-5.0 \
	gnome-keyring \
	nano \
	nodejs \
	remmina \

npm i -g npm yarn

curl -L https://get.docker.com/ | bash
usermod -aG docker vtsv
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose

git config --global user.name "Steve Desmond"
git config --global user.email "steve@vtsv.ca"
git config --global core.editor "code --wait"

git config --global alias.l "log --oneline --decorate --graph"
git config --global alias.la "l --all"
git config --global alias.lh "l HEAD^..HEAD"
git config --global alias.p "pull --prune"
git config --global alias.ca "commit --amend --no-edit"
git config --global alias.pf "push --force-with-lease"

apt autoremove -y
apt autoclean -y
