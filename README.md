# conda-recipes
Anaconda recipes for disseminating CCMC software.


# Requirements

If you don't already have anaconda installed, get miniconda from the installers here and follow Quick Install instructions.

  http://conda.pydata.org/miniconda.html

Install anaconda-build:

```
  conda install anaconda-build
```

# Building a recipe

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
