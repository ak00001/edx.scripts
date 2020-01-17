#!/bin/sh

set -eu

#---------------------------------------------------------
# original script by:   https://github.com/lpm0073
#                       
#
# here adapted by:      NTNU Beta v/Andreas Krokan
#
# date:       january 20, 2020
#
# usage:      Install Tutor and its prerequisites.
#             curl -sSL https://raw.githubusercontent.com/ak00001/edx.scripts/master/tutor.install.sh | bash -e
#
# reference:  https://docs.tutor.overhang.io/quickstart.html
#
# Notes:
#     
#     NTNU IT Halvadministrert Linux / VMWare | 49GiB | 8Gib DIMM DRAM EDO | Ubuntu 18.04.3 LTS bionic 
#
#      - Root:        kursutvikling.it.ntnu.no
#      - LMS:         kursutvikling.it.ntnu.no
#      - LMS preview: preview.kursutvikling.it.ntnu.no (alias)
#      - Notes:       notes.kursutvikling.it.ntnu.no (alias)
#      - CMS:         studio.kursutvikling.it.ntnu.no (alias)
#
#
# Trouble Shooting:
#     ~/.local/share/tutor/env/apps/openedx/config
#     tutor local logs nginx
#---------------------------------------------------------
#
#Install Docker: https://docs.docker.com/install/linux/docker-ce/ubuntu/
#================================
# this line looks for, and remove any existing installation of docker.
#sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#
# check install
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo gpasswd -a $USER docker
sudo usermod -a -G docker $USER
sudo -H -u root bash << EOF
# test Docker installation
docker run hello-world
EOF
#
#Install Docker Composer: https://docs.docker.com/compose/install/
#================================
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# test installation
docker-compose --version
#
