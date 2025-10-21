cd $HOME
mkdir -p opt usr/local tmp

# Embree
cd $HOME/opt
wget -O embree3.tgz https://github.com/embree/embree/releases/download/v3.13.5/embree-3.13.5.x86_64.linux.tar.gz
tar xzf embree3.tgz && rm -f embree3.tgz

# Vulkan SDK
VSDK_VER=1.3.296.0
mkdir -p $HOME/opt/vulkansdk
cd $HOME/opt/vulkansdk
wget -O vulkansdk.tar.xz "https://sdk.lunarg.com/sdk/download/${VSDK_VER}/linux/vulkansdk-linux-x86_64-${VSDK_VER}.tar.xz?Human=true"
tar -xf vulkansdk.tar.xz && rm -f vulkansdk.tar.xz
ln -sfn "${VSDK_VER}" current

# CUDA 11.8
CUDA_VERSION=11.8.0
CUDA_INSTALL_DIR=$HOME/usr/local/cuda-11.8
TMP_DIR=$HOME/tmp/cuda-install
mkdir -p "$TMP_DIR"
mkdir -p "$(dirname "$CUDA_INSTALL_DIR")"
cd "$TMP_DIR"
wget https://developer.download.nvidia.com/compute/cuda/${CUDA_VERSION}/local_installers/cuda_${CUDA_VERSION}_520.61.05_linux.run
chmod +x cuda_${CUDA_VERSION}_520.61.05_linux.run
./cuda_${CUDA_VERSION}_520.61.05_linux.run --silent --toolkit --toolkitpath="$CUDA_INSTALL_DIR" --override
rm -rf "$TMP_DIR"

# Update rc file
if [[ $SHELL == *"bash"* ]]; then
	RC_FILE="$HOME/.bashrc"
elif [[ $SHELL == *"zsh"* ]]; then
	RC_FILE="$HOME/.zshrc"
else 
	echo "Unsupported shell: $SHELL" >&2
	exit 1
fi

echo -e "\n# CUDA 11.8 user-local install\nexport PATH=\$HOME/usr/local/cuda-11.8/bin:\$PATH\nexport LD_LIBRARY_PATH=\$HOME/usr/local/cuda-11.8/lib64:\$LD_LIBRARY_PATH\nexport CUDA_HOME=\$HOME/usr/local/cuda-11.8" >> "$RC_FILE"
source $RC_FILE