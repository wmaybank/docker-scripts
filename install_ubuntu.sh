#!/bin/bash

# Actualiza el índice de paquetes y las actualizaciones del sistema
sudo apt update
sudo apt upgrade -y

# Instala paquetes necesarios para agregar repositorios HTTPS
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Agrega la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agrega el repositorio de Docker al sistema
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualiza el índice de paquetes después de agregar el repositorio
sudo apt update

# Instala Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Agrega tu usuario al grupo "docker" para ejecutar Docker sin sudo
sudo usermod -aG docker $USER

# Instala Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Comprueba la versión de Docker y Docker Compose
docker --version
docker-compose --version
