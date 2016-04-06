#!/bin/bash

# Note from cmake docs:
# $ORIGIN: On Linux/Solaris, it's probably a very good idea to specify any RPATH
# setting one requires to look up the location of a package's private libraries 
# via a relative expression, to not lose the capability to provide a fully relocatable package. 
# This is what $ORIGIN is for. In CMAKE_INSTALL_RPATH lines, it should have its dollar sign escaped 
# with a backslash to have it end up with proper syntax in the final executable. See also the CMake 
# and $ORIGIN discussion. For Mac OS X, there is a similar @rpath, @loader_path and @executable_path mechanism. 
# While dependent libraries use @rpath in their install name, relocatable executables should use @loader_path 
# and @executable_path in their RPATH. For example, you can set CMAKE_INSTALL_RPATH to @loader_path, and if 
# an executable depends on "@rpath/libbar.dylib", the loader will then search for "@loader_path/libbar.dylib", 
# where @rpath was effectively substituted with @loader_path.

if [ "$(uname)" == "Darwin" ]; then
	c_compiler=clang
	cpp_compiler=clang++
	executable_rpath=@loader_path/../../../../lib/ccmc/
	PY_LIB="libpython${PY_VER}.dylib"
fi
if [ "$(uname)" == "Linux" ]; then
	c_compiler=gcc
	cpp_compiler=g++
	executable_rpath=\\\${ORIGIN}/../../../../lib/ccmc/
	PY_LIB="libpython${PY_VER}.so"
      exe_linker_flags="-Wl,-rpath,${PREFIX}/lib/ -L ${PREFIX}/lib"
fi
# export executable_rpath=../../lib/ccmc
echo "PWD:" $PWD
echo "PREFIX:" ${PREFIX}
ls ${PREFIX}/include/
# mkdir build
# cd build

echo "current path:"$PWD
echo "executable_rpath:"$executable_rpath


# -DCMAKE_MACOSX_RPATH=${PREFIX}
${PREFIX}/bin/cmake ${SRC_DIR}/kameleon-plus/trunk/kameleon-plus-working \
      -DCMAKE_FIND_ROOT_PATH=${PREFIX} \
      -DCMAKE_C_COMPILER=${c_compiler} \
      -DCMAKE_CXX_COMPILER=${cpp_compiler} \
      -DCMAKE_CXX_FLAGS="-std=c++11" \
      -DCDF_PATH=${PREFIX} \
      -DBOOST_LIBRARYDIR=${PREFIX}/lib \
      -DBOOST_INCLUDEDIR=${PREFIX}/include/ \
      -DCMAKE_INSTALL_RPATH=${executable_rpath} \
      -DCMAKE_EXE_LINKER_FLAGS=${exe_linker_flags} \
      -DPYTHON_LIBRARY=${PREFIX}/lib/${PY_LIB} \
      -DPYTHON_INCLUDE_DIR=${PREFIX}/include/python${PY_VER} \
      -DPYTHON_EXECUTABLE=${PYTHON} \
      -DBUILD_JAVA=OFF \
      -DBUILD_HDF5=ON \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DINSTALL_CCMC_PYTHON_MODULE=ON 

		
# cmake -DCMAKE_CXX_FLAGS="-std=c++11" 
# 	-DCMAKE_C_COMPILER=/usr/bin/clang 
# 	-DCMAKE_CXX_COMPILER=/usr/bin/clang++ 
# 	-DBOOST_LIBRARYDIR=/Users/apembrok/anaconda_boost_install/lib 
# 	-DBOOST_INCLUDEDIR=/Users/apembrok/anaconda_boost_install/include 
# 	-DBoost_NO_SYSTEM_PATHS=ON 
# 	-DPYTHON_LIBRARY=/Users/apembrok/anaconda/lib/libpython2.7.dylib 
# 	-DPYTHON_INCLUDE_DIR=/Users/apembrok/anaconda/include/python2.7/ 
# 	-DPYTHON_EXECUTABLE=/Users/apembrok/anaconda/bin/python2.7 
# 	-DBUILD_JAVA=OFF 
# 	-DBUILD_HDF5=OFF 
# 	-DCMAKE_INSTALL_PREFIX=/Users/apembrok/anaconda 
# 	-DINSTALL_CCMC_PYTHON_MODULE=ON

make -j8
make install
