#!/bin/bash
# script by Andreas Krokan
#
# date:  jan 20. 2020
#
# usage:    Install and enable plugin for Tutor configuration: tutor-digit-config
#           curl -sSL https://raw.githubusercontent.com/ak00001/edx.scripts/master/tutor.install.plugin | bash -e
#
# Install plugin via PIP
echo "Starting to install packages, Yippie. Kaye. Yay...." 
pip install -e git+https://github.com/NTNUbeta/tutor-digit-config#egg=tutor-digit-config
tutor plugins enable digit-config
echo "Re-generating environment with 'tutor config save'"
tutor config save
echo "Listing installed plugins..."
tutor plugins list
