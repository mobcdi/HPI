# HPI

##What the scripts do
opencv2_4_13.sh is the main file used to download the Opencv2 source code and create the directories, compile the code and then install it
OpenCVWorker.sh is the script that runs on the other workers in the cluster to update the OS, install default jdk, install OpenCV2 and possibly other tasks (maybe pip install)

**I might create another script to uninstall OpenCV as well**

##Notes to Me:
- Run the script as sudo
- To uninstall cd to build directory and run sudo make uninstall
- `sudo apt-get install git` to install git then `git clone https://github.com/mobcdi/HPI.git` to pull down the repo
- `chmod +x file.sh` to make the script executable
- `git push --mirror https://github.com/nobcdi/HPI.git` to push the changes back to github 

##To test for OpenCV2 
from a terminal run
```
$ python
import cv2
cv2.__version__ 
```
and you should get back `2.4.13`
