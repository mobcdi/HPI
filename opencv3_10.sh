#!/bin/bash
arch=$(uname -m)
if [ "$arch" == "i686" -o "$arch" == "i386" -o "$arch" == "i486" -o "$arch" == "i586" ]; then
flag=1
else
flag=0
fi
#script based on 
# 
# http://www.pyimagesearch.com/2015/06/22/install-opencv-3-0-and-python-2-7-on-ubuntu/
echo "Installing OpenCV 3.10"
mkdir OpenCV
cd OpenCV
echo "Removing any pre-installed ffmpeg and x264"
sudo apt-get -y remove ffmpeg x264 libx264-dev

echo "Update the OS first"
sudo apt-get -y update
sudo apt-get -y upgrade
echo "Installing Default jdk"
sudo apt-get -y install default-jdk
echo "Installing Tesseract for text recognition as it needs to be installed before OpenCV"
sudo apt-get -y install tesseract-ocr
echo "Installing unzip"
sudo apt-get -y install unzip
echo "Installing git"
sudo apt-get -y install git
echo "And some other stuff"
sudo apt-get install build-essential cmake pkg-config
echo "Installing OpenCV Dependenices"
sudo apt-get -y install libopencv-dev
sudo apt-get -y install checkinstall yasm
echo "Installing Packages to handle images"
sudo apt-get -y install libtiff4-dev libjpeg8-dev libjasper-dev libpng12-dev
echo "Installing Packages to handle video streams"
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get -y install python-dev python-numpy
sudo apt-get -y install libtbb-dev libeigen3-dev
sudo apt-get -y install libqt4-dev libgtk2.0-dev
sudo apt-get -y install libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
sudo apt-get -y install x264 v4l-utils ffmpeg
echo "Install GUI module package" 
sudo apt-get -y install libgtk2.0-dev
echo "Installing pip for python"
sudo apt-get -y python-pip
echo "Installing Scipy Stack"
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
echo "Installing pip for python"
sudo apt-get -y python-pip
echo "Installing scikit-learn"
sudo pip install -U scikit-learn
echo "Installing the python modules"
sudo pip install pytesseract
echo "Getting OpenCV3 from GitHub"
git clone https://github.com/Itseez/opencv.git
cd opencv
git checkout 3.1.0
echo "Going up the directory tree to get out of opencv directory"
cd ..
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib
git checkout 3.1.0
cd ..
cd opencv
rm -rf build
mkdir build
cd build
# original: cmake -D CUDA_ARCH_BIN=3.2 -D CUDA_ARCH_PTX=3.2 -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D BUILD_TIFF=ON -D WITH_QT=ON -D WITH_OPENGL=ON .. 
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D BUILD_TIFF=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j$(nproc)
sudo make install
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
echo "OpenCV 3.10 ready to be used"
