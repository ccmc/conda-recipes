# Description
Anaconda recipes for disseminating CCMC software.


# Requirements

If you don't already have anaconda installed, get miniconda2 from the installers here and follow Quick Install instructions.

  http://conda.pydata.org/miniconda.html

This will install miniconda2 to e.g. *path/to/miniconda2*

The installer will ask if you wish to prepend  *path/to/miniconda2/bin* to your PATH. You can say no, in which case you must use the full path explicitly when calling any of the conda commands below (**conda**, **activate**, etc).

# Creating an environment

Clone/download this repository and navigate to the environments folder:

```
cd conda-recipes/environments/kameleon

```

Create the environment appropriate for your platform. For example, on linux:

```
conda create --name mykameleon --file kameleon-plotly-linux.txt
```
and on Mac OSX:
```
conda create --name mykameleon --file kameleon-plotly-osx.txt
```

The "mykameleon" environment will be loaded with kameleon libraries in addition to all requirements, including plotly.

## Activating environments

You can "activate" the environment with

```
source activate mykameleon
```
which will prepend *path/to/miniconda2/envs/mykameleon/bin* to **PATH**, set the environment variable **CONDA_ENV_PATH**, and prepend your prompt with **(mykameleon)**. 


This allows you to run kameleon's version of python without writing out the full path. For example, we can print the help documentation for the ionosphere visualizer like this:
```
(mykameleon)$ cd $CONDA_ENV_PATH/bin/ccmc/examples/python
(mykameleon)$ python ionosphere_test.py -h
```

While the environment is activated you can install additional requirements for your project:
```
(mykameleon)$ conda install scipy
(mykameleon)$ pip install spacepy
```

## Updating kameleon 

The main benefit of the conda install is that you can keep up-to-date with the latest kameleon builds. With the environment activated:

```
(mykameleon)$ conda update kameleon
```

# Working outside an environment

You can easily work outside of the environment and still use kameleon programs and libraries. Just prepend the full path to the appropriate executables.

```
cd path/to/miniconda2/envs/mykameleon/bin/ccmc/examples/python
path/to/miniconda2/envs/mykameleon/bin/python ionosphere_test.py -h
```

# Building a recipe

First install anaconda-build:

```
  conda install anaconda-build
```

Clone/download this repository and navigate to the recipe you want to build. For example,

```
cd conda-recipes/kameleon
```

Now build. 

```
conda build .
```

This will download any requirements needed for the application, compile it as a system-dependant relocatable package, then compress it as a tar file. conda-build will tell you where the resulting file is, but if you can check it from the recipe directory:

```
conda build . --output
```

