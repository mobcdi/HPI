# HPI

Opencv install script based off https://github.com/jayrambhia/Install-OpenCV/blob/master/Ubuntu/2.4/opencv2_4_10.sh but added option to make command to compile taking into consideration the number of processors available to the computer as running on a vm could cause the build to fail. Also needed to get the swap partition increased 

##Notes to Me:
- Run the script as sudo
- To uninstall cd to build directory and run sudo make uninstall

##To test for OpenCV2 
from a terminal run
```
$ python
import cv2
cv2.__version__ 
```
and you should get back `2.4.13`
