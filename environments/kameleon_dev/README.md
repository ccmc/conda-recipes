# Purpose

The development environment makes it easy for kameleon-plus developers for making quick changes that may involve recompiling the code.

# Preparing the kameleon-dev environment

	$ conda create --name kameleon-dev --file path/to/ccmc/conda-recipes/environments/kameleon_dev/kameleon-dev-osx.txt

This will generate a kameleon-dev environment that includes all the requirements for compiling and installing kameleon-plus.

However, due to issues with conda's library install names on osx, you must fix their install names so they include @rpath (see below).

## Fixing @rpaths (prior to compiling):

You'll need to make a python3 environment to be used for running the patch command:

	$ conda create --name patch_rpaths python=3
	$ conda install -c minrk patch-conda-rpaths -n patch_rpaths

Now run the command on your kameleon-dev environment's lib folder

	$ source activate patch_rpaths
	(patch_rpaths)$ patch-conda-rpaths path/to/env/kameleon-dev/lib
	$ source deactivate

If the script gets stuck on a particular library, try running it again on just that library

	(patch_rpaths)$ patch-conda-rpaths path/to/env/kameleon-dev/lib/libname.dylib

Make sure that libpython2.7.dylib has been patched

	(patch_rpaths)$ patch-conda-rpaths path/to/env/kameleon-dev/lib/libpython2.7.dylib

# Compiling Kameleon-plus

Clone this git repo:

	$ git clone https://github.com/ccmc/ccmc-software.git


Check out the desired branch (master is default):
	
	$ cd ccmc-software
	$ git checkout CoordinateTransformations


Make a fresh build directory somewhere. This will contain all make files and generated binaries:

	$ mkdir path/to/build 
	$ cd path/to/build


Activate the environment, then run cmake script:

	$ source activate kameleon-dev
	(kameleon-dev)$ source path/to/ccmc/conda-recipes/environments/kameleon_dev/cmake_command.sh path/to/ccmc-software/kameleon-plus/trunk/kameleon-plus-working/

And, finally, compile the code:

	$ make -j8