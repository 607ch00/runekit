#!/bin/bash
export SETUPTOOLS_USE_DISTUTILS=stdlib

rm -rf build
rm -rf dist
rm -rf runekit.egg-info
rm linuxdeploy-AppImage

python -m pip install poetry
poetry install
poetry run make runekit/_resources.py
# cd build
wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -O linuxdeploy.AppImage
chmod +x linuxdeploy.AppImage
LINUXDEPLOY=./linuxdeploy.AppImage make dist/RuneKit.AppImage