#!/bin/bash

make OS=macosx ENV=$OSX_ARCH
make install INSTALLDIR=$PREFIX
