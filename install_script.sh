# This is for install tensorflow with GTX1080 drvier.
# refered link
# https://www.bazel.io/versions/master/docs/install.html#compiling-from-source
# http://www.nvidia.com/object/gpu-accelerated-applications-tensorflow-installation.html
# 


echo ------------------- install-essentional utils -------------------
sudo apt-get install git
sudo apt-get install vim


echo ------------------- install-update pip and essentional -------------------
sudo apt-get install python-pip python-dev
sudo pip install numpy
pip install --upgrade pip


echo ------------------- install_java for installing bazel -------------------
sudo apt-get install software-properties-common swig
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
echo "deb http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | sudo apt-key add -
sudo apt-get update - See more at: http://www.nvidia.com/object/gpu-accelerated-applications-tensorflow-installation.html#sthash.sG3VIfZK.dpuf

echo ------------------- installing bazel -------------------
wget https://github.com/bazelbuild/bazel/archive/0.3.2.tar.gz
tar -xvzf 0.3.2.tar.gz
cd bazel-0.3.2/
sudo ./compile.sh
sudo cp output/bazel /usr/local/bin
cd ..

echo ------------------- bulding tensorflow with bazel -------------------

git clone https://github.com/tensorflow/tensorflow
git reset --hard 287db3a
cd tensorflow/
./configure

bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

sudo pip install --upgrade /tmp/tensorflow_pkg/tensorflow-0.12*
sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/protobuf-3.0.0b2.post2-cp27-none-linux_x86_64.whl


echo ------------------- Test tensorflow -------------------
cd ..
python test_tensorflow.py


echo ------------------- End script -------------------



