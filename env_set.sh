#!/bin/bash

# ----------------------
# this shell script
# aims to install basic
# pack of develop vision
# ----------------------

# basic needs
echo "welcome! this is a auto env config script,what you only need to do is input your passwd. once the process start,leave it along!"

sudo apt-get install git vlc simplescreenrecorder synaptic cutecom qv4l2 cmake build-essential htop ssh octave -y

echo "good job! now just wait until it finish. when it's done we will tell you about it with a long sequence like : --------------------------- ,and also some prompts."

# "IDE"
sudo snap install code --classic # vscode
sudo snap install netron # netron for visualization of model structure
# sudo snap install clion --classic

 # OpenCV
sudo apt-get install libopencv-dev python3-opencv libopencv-contrib-dev python3-pip -y
pip install opencv-python opencv-contrib-python -i https://pypi.tuna.tsinghua.edu.cn/simple # opencv-python

# build ceres
cd
git clone https://ceres-solver.googlesource.com/ceres-solver
sudo apt-get install libgoogle-glog-dev libgflags-dev libatlas-base-dev libeigen3-dev libsuitesparse-dev -y
cd ceres-solver
mkdir ceres-bin
cd ceres-bin
cmake ..
make -j12
make test
sudo make install
cd


# delete temp dir after installation
mkdir temp_store_dir
cd temp_store_dir


# installatino of sunlogin and noMachine
wget https://down.oray.com/sunlogin/linux/SunloginClient_11.0.1.44968_amd64.deb
sudo dpkg -i SunloginClient_11.0.1.44968_amd64.deb
wget https://download.nomachine.com/download/7.10/Linux/nomachine_7.10.1_1_amd64.deb
sudo dpkg -i nomachine_7.10.1_1_amd64.deb

# installatin of intel OpenVINO if your platform is of that kind





# installation of HIK industrial camera driver and client,if your cam is of that kind
wget https://www.hikrobotics.com/cn2/source/support/software/MVS_STD_GML_V2.1.1_220511.zip
unzip MVS_STD_GML_V2.1.1_220511.zip
sudo dpkg -i MVS-2.1.1_x86_64_20220511.deb
wget https://github.com/NeoZng/vision_tutorial/blob/main/MvCamCtrlSDK_Runtime-3.2.0_x86_64_20210915.deb
sudo dpkg -i MvCamCtrlSDK_Runtime-3.2.0_x86_64_20210915.deb


# installation of VOFA,a serial scope
wget https://je00.github.io/downloads/vofa+_1.3.10_amd64.deb
sudo dpkg -i https://je00.github.io/downloads/vofa+_1.3.10_amd64.deb


# microsoft edge
#wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_104.0.1293.63-1_amd64.deb
#sudo dpkg -i microsoft-edge-stable_104.0.1293.63-1_amd64.deb

cd 
rm -rf temp_store_dir


# Optional,installation of consolas for better experience
wget -O /tmp/YaHei.Consolas.1.12.zip https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/uigroupcode/YaHei.Consolas.1.12.zip
unzip /tmp/YaHei.Consolas.1.12.zip
sudo mkdir -p /usr/share/fonts/consolas
sudo mv YaHei.Consolas.1.12.ttf /usr/share/fonts/consolas/
sudo chmod 644 /usr/share/fonts/consolas/YaHei.Consolas.1.12.ttf
cd /usr/share/fonts/consolas
sudo mkfontscale && sudo mkfontdir && sudo fc-cache -fv
cd


echo "----------------------------"
echo " " 
echo "Congratulations,everthing is done! ! ! now you can begin your development and learning!"
echo " " 
echo "----------------------------"
