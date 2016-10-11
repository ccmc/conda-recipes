#!/bin/bash

export CXX="clang++" 
export CXXFLAGS="-std=c++11 -stdlib=libc++"
MACOSX_DEPLOYMENT_TARGET=10.9

./configure --prefix=$PREFIX --enable-linux-lfs --with-zlib=$PREFIX --with-ssl --enable-cxx
make
make install

rm -rf $PREFIX/share/hdf5_examples
