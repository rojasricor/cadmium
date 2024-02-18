# Actualiza las fuentes de APT
echo 'deb-src http://azure.archive.ubuntu.com/ubuntu/ lunar main restricted' | sudo tee -a /etc/apt/sources.list
sudo apt update

# Instala paquetes necesarios
sudo apt install -y libunwind-dev arch-install-scripts gcc-arm-linux-gnueabihf libarchive-tools curl wget f2fs-tools cgpt vboot-utils libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf qemu-user-static gcc-aarch64-linux-gnu debootstrap binutils-aarch64-linux-gnu git u-boot-tools binfmt-support lz4

# Elimina el archivo de configuración existente
rm config

# Copia la configuración de cadmium
cp cadmium-configs/config-arm64-arch config

# Ejecuta la construcción
sudo ./build-all arm64-arch.img 10G

# Comprime la imagen
gzip arm64-arch.img

# Cambia los permisos del archivo comprimido
chmod 666 arm64-arch.img.gz

# Sube los artefactos (este paso no se puede replicar fácilmente en un entorno local)
