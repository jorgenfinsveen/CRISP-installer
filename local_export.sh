#!/usr/bin/env bash

export ROOT="$HOME/crisp/crisp-framework"
export MESA_SIM="$ROOT/mesa-vulkan-sim/lib"
export VK_ICD_FILENAMES="$MESA_SIM/share/vulkan/icd.d/lvp_icd.x86_64.json"
export EMBREE_ROOT=~/opt/embree-3.13.5.x86_64.linux
export VULKAN_SDK=~/opt/vulkansdk/current/x86_64
export CUDA_HOME=~/usr/local/cuda-11.8
export CUDA_INSTALL_PATH=$CUDA_HOME
export PATH=$VULKAN_SDK/bin:$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$EMBREE_ROOT/lib:$CUDA_HOME/lib64:$VULKAN_SDK/lib
export CUDA_LIB64="${CUDA_INSTALL_PATH}/lib64"
export VKSIM_DIR="$ROOT/vulkan-sim"
export EMBREE_DIR=$EMBREE_ROOT
export EMBREE_INC="${EMBREE_ROOT}/include"
export EMBREE_LIB="${EMBREE_ROOT}/lib"


source "$ROOT/vulkan-sim/setup_environment"
source "$EMBREE_ROOT/embree-vars.sh"
