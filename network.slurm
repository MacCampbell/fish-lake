#!/bin/bash

#SBATCH -p high
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=4G
#SBATCH --time=5-05:05:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=maccampbell@ucdavis.edu
#SBATCH --output=outputs/107/network/net.out # File to which STDOUT will be written
#SBATCH --error=outputs/107/network/net.err # File to which STDERR will be written


module load julia/1.10.2

julia -p 10 network.jl
