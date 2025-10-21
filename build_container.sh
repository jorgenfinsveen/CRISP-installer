cd $HOME
export ROOT="$HOME/crisp/crisp-framework"
 
apptainer build accel-sim.sif docker://tgrogers/accel-sim_regress:Ubuntu-22.04-cuda-11.7
apptainer run --nv --bind $ROOT/accel-sim-framework:/accel-sim/accel-sim-framework $HOME/accel-sim.sif
