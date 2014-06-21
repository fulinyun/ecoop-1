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



PREFIX=/home/$USER/Envs/env1
export PATH=$PREFIX/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/lib64:$LD_LIBRARY_PATH

version="2"
if [[ "$version" == "2" ]]
then pip=$PREFIX/bin/pip2.7
else pip=$PREFIX/bin/pip3.4
fi


echo "installing virtualenv"
$pip install -U virtualenv
echo "installing setuptools"
$pip install -U setuptools
echo "installing dateutils"
$pip install -U dateutils
echo "installing docutils"
$pip install -U docutils
echo "installing jinja2"
$pip install -U jinja2
echo "installing nose"
$pip install -U nose
echo "installing numpy"
$pip install -U numpy
echo "installing paramiko"
$pip install -U paramiko
echo "installing Image"
$pip install -U Image
echo "installing pygments"
$pip install -U pygments
echo "installing scipy"
$pip install -U scipy
echo "installing sphinx"
$pip install -U sphinx
echo "installing pyzmq"
$pip install -U pyzmq
echo "installing tornado"
$pip install -U tornado
echo "installing envoy"
$pip install -U envoy
echo "installing qrcode"
$pip install -U qrcode
echo "installing requests"
$pip install -U requests
echo "installing owslib"
$pip install -U owslib
echo "installing python-magic"
$pip install -U python-magic
