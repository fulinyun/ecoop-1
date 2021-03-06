#!/bin/bash

###############################################################################
#
#
# Project: ECOOP, sponsored by The National Science Foundation
# Purpose: this code is part of the Cyberinfrastructure developed for the ECOOP project
#                http://tw.rpi.edu/web/project/ECOOP
#                from the TWC - Tetherless World Constellation
#                            at RPI - Rensselaer Polytechnic Institute
#                            founded by NSF
#
# Author:   Massimo Di Stefano , distem@rpi.edu -
#                http://tw.rpi.edu/web/person/MassimoDiStefano
#
###############################################################################
# Copyright (c) 2008-2014 Tetherless World Constellation at Rensselaer Polytechnic Institute
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
###############################################################################


np=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)


CURRENTDIR=${PWD}
BUILD=epilib
PREFIX=/home/$USER/Envs/env1

TEMPBUILD=/home/$USER/$BUILD
mkdir -p $TEMPBUILD
mkdir -p $TEMPBUILD/tarball
mkdir -p $TEMPBUILD/src

export PATH=$PREFIX/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/lib64:$LD_LIBRARY_PATH

cd $TEMPBUILD

version="2"
if [[ "$version" == "2" ]]
then python=$PREFIX/bin/python2.7
else python=$PREFIX/bin/python3.4
fi

if [[ "$version" == "2" ]]
then pip=$PREFIX/bin/pip2.7
else pip=$PREFIX/bin/pip3.4
fi


cd $PREFIX
wget --no-check-certificate -c --progress=dot:mega http://repo.continuum.io/pkgs/free/linux-64/llvm-3.3-0.tar.bz2
tar -xjf llvm-3.3-0.tar.bz2
rm -rf llvm-3.3-0.tar.bz2

#PATH+=$PREFIX/bin
#export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/lib64:$LD_LIBRARY_PATH

export LLVM_CONFIG_PATH=$PREFIX/bin/llvm-config
$LLVM_CONFIG_PATH --cflags # test llvm-config
export LLVMPY_DYNLINK=1
export CFLAGS="-Wno-strict-aliasing -Wno-unused -Wno-write-strings -Wno-unused-function"

cd $TEMPBUILD
git clone https://github.com/hgrecco/llvmpy.git -q
cd llvmpy ; $python setup.py install -q >/dev/null ; cd ..
#rm -rf llvmpy
export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/lib64:$LD_LIBRARY_PATH
git clone https://github.com/numba/numba.git
cd numba
$pip install -r requirements.txt
$python setup.py install
cd ..
#rm -rf numba
#rm -rf llvmpy
# or move to src

### start Blaze and few extra pkg

$pip install -U Blosc

git clone https://github.com/ContinuumIO/blz.git
cd blz
$python setup.py install
cd ..
# rm -rf blz

git clone https://github.com/ContinuumIO/datashape.git
cd datashape
$python setup.py install
cd ..
# rm -rf datashape

git clone https://github.com/ContinuumIO/dynd-python
cd dynd-python
mkdir libraries
cd libraries
git clone https://github.com/ContinuumIO/libdynd
cd ..
mkdir build
cd build
$PREFIX/bin/cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .. #-DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -j $np
make install
cd ../..

git clone https://github.com/pykit/pykit.git
cd pykit
$python setup.py install
cd ..

git clone https://github.com/ContinuumIO/blaze.git
cd blaze
$python setup.py install
cd ..

$pip install -U pyyaml
$pip install -U ply


git clone git://github.com/Theano/Theano.git
cd Theano
$python setup.py install
cd ..

