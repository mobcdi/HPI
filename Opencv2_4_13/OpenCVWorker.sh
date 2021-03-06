#!/bin/bash
arch=$(uname -m)
if [ "$arch" == "i686" -o "$arch" == "i386" -o "$arch" == "i486" -o "$arch" == "i586" ]; then
flag=1
else
flag=0
fi
echo "Update the OS first"
sudo apt-get -y update
sudo apt-get -y upgrade
echo "Installing Default jdk"
sudo apt-get -y install default-jdk
echo "Installing Tesseract for text recognition as it needs to be installed before OpenCV"
sudo apt-get -y install tesseract-ocr
echo "Installing pip for python"
sudo apt-get -y python-pip
# if you need to install python modules via pip use sudo pip install [packagename]
echo "Installing OpenCV 2.4.13 on Worker node"
echo "Assuming running from within build folder on shared storage"
echo "Removing any pre-installed ffmpeg and x264"
sudo apt-get -y remove ffmpeg x264 libx264-dev
echo "Installing unzip"
sudo apt-get -y install unzip
echo "Installing Dependenices"
sudo apt-get -y install libopencv-dev
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y install libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get -y install python-dev python-numpy
sudo apt-get -y install libtbb-dev libeigen3-dev
sudo apt-get -y install libqt4-dev libgtk2.0-dev
sudo apt-get -y install libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
sudo apt-get -y install x264 v4l-utils ffmpeg
sudo apt-get -y install libgtk2.0-dev
# original: cmake -D CUDA_ARCH_BIN=3.2 -D CUDA_ARCH_PTX=3.2 -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D BUILD_TIFF=ON -D WITH_QT=ON -D WITH_OPENGL=ON .. 
# cmake -D CUDA_ARCH_BIN=3.2 -D CUDA_ARCH_PTX=3.2 -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D BUILD_TIFF=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
# make -j$(nproc)
sudo make install
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
echo "OpenCV 2.4.13 ready to be used but test it anyway"
echo "To test open the python terminal"
echo "python"
echo "import cv2"
echo "cv2.__version__"
echo "Should I also copy over the Spart Worker?"
