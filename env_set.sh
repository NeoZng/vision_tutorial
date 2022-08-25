sudo apt-get install bulid-essential # for build and make task
sudo apt-get install cmake # CMake
sudo apt-get install qv4l2 # tool for USB camera
sudo apt-get install cutecom # for serial port

sudo snap install code --classic # vscode
sudo snap install netron # netron for visualization of model structure


sudo apt-get install libopencv-dev python3-opencv libopencv-contrib-dev # OpenCV
sudo apt-get install python3-pip
pip install opencv-python opencv-contrib-python -i https://pypi.tuna.tsinghua.edu.cn/simple # opencv-python


sudo apt-get install libeigen3-dev # eigen

# build ceres
git clone https://ceres-solver.googlesource.com/ceres-solver
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libeigen3-dev
sudo apt-get install libsuitesparse-dev
cd ceres-solver
mkdir ceres-bin
cd ceres-bin
cmake ..
make -j12
make test
make install
echo "if you failed to install(permission denied or),try add 'sudo' in line 23"
cd


# Optional,installation of consolas for better experience
wget -O /tmp/YaHei.Consolas.1.12.zip https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/uigroupcode/YaHei.Consolas.1.12.zip
unzip /tmp/YaHei.Consolas.1.12.zip
sudo mkdir -p /usr/share/fonts/consolas
sudo mv YaHei.Consolas.1.12.ttf /usr/share/fonts/consolas/
sudo chmod 644 /usr/share/fonts/consolas/YaHei.Consolas.1.12.ttf
cd /usr/share/fonts/consolas
sudo mkfontscale && sudo mkfontdir && sudo fc-cache -fv
cd

# installation of HIK industrial camera driver and client
wget https://www.hikrobotics.com/cn2/source/support/software/MVS_STD_GML_V2.1.1_220511.zip
unzip MVS_STD_GML_V2.1.1_220511.zip -o temp
cd temp
sudo dpkg -i MVS-2.1.1_x86_64_20220511.deb
wget https://github.com/NeoZng/vision_tutorial/blob/main/MvCamCtrlSDK_Runtime-3.2.0_x86_64_20210915.deb
sudo dpkg -i MvCamCtrlSDK_Runtime-3.2.0_x86_64_20210915.deb

# installatino of sunlogin and noMachine
wget https://down.oray.com/sunlogin/linux/SunloginClient_11.0.1.44968_amd64.deb
sudo dpkg -i SunloginClient_11.0.1.44968_amd64.deb
wget https://download.nomachine.com/download/7.10/Linux/nomachine_7.10.1_1_amd64.deb
sudo dpkg -i nomachine_7.10.1_1_amd64.deb
