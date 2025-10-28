cd $HOME
mkdir -p crisp
cd crisp
git clone https://github.com/JRPan/crisp-artifact.git crisp-framework
cd crisp-framework
wget https://raw.githubusercontent.com/jorgenfinsveen/CRISP-installer/main/local_export.sh
source local_export.sh

source $ROOT/vulkan-sim/setup_environment
cd $ROOT/mesa-vulkan-sim
rm -rf build
meson setup --prefix="${PWD}/lib" build -Dgallium-drivers=iris,swrast,zink -Dvulkan-drivers=intel,amd,swrast -Dplatforms=x11,wayland
meson configure build
ninja -C build install

cd $ROOT/vulkan-sim/
make -j
cd $ROOT/mesa-vulkan-sim
ninja -C build/ install
