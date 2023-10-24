#!/bin/bash

# Actualizar el índice de paquetes
sudo apt update

# Instalar dependencias para usar repositorios HTTPS
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Agregar la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio de Docker al sistema
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar el índice de paquetes después de agregar el repositorio
sudo apt update

# Instalar la última versión de Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Agregar el usuario actual al grupo docker para ejecutar Docker sin sudo
sudo usermod -aG docker $USER

# Iniciar y habilitar el servicio Docker
sudo systemctl enable docker
sudo systemctl start docker

# Verificar la instalación
docker --version

echo "Docker se ha instalado correctamente."
