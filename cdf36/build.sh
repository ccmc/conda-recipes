#!/bin/bash
if [ "$(uname)" == "Darwin" ]; then
	make OS=macosx ENV=$OSX_ARCH all
	make install INSTALLDIR=$PREFIX
fi

if [ "$(uname)" == "Linux" ]; then
	make OS=linux ENV=gnu all
	make install INSTALLDIR=$PREFIX
fi

