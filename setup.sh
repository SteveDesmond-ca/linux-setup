#!/usr/bin/env bash

sudo apt update
sudo apt full-upgrade -y
sudo apt-get install -y \
	apt-transport-https \
	wget \

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
rm -f packages.microsoft.gpg

wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

curl -fsSL https://deb.nodesource.com/setup_current.x | sudo bash -

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update -y
sudo apt install -y \
	code \
	dotnet-sdk-3.1 \
	dotnet-sdk-5.0 \
	dotnet-sdk-6.0 \
	gh \
	gnome-keyring \
	nano \
	nodejs \
	remmina \

sudo npm i -g npm yarn

curl -L https://get.docker.com/ | sudo bash
sudo usermod -aG docker vtsv
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose

git config --global user.name "Steve Desmond"
git config --global user.email "steve@vtsv.ca"
git config --global core.editor "code --wait"

git config --global alias.l "log --oneline --decorate --graph"
git config --global alias.la "l --all"
git config --global alias.lh "l HEAD^..HEAD"
git config --global alias.p "pull --prune"
git config --global alias.ca "commit --amend --no-edit"
git config --global alias.pf "push --force-with-lease"

sudo apt autoremove -y
sudo apt autoclean -y
