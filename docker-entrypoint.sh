cd ~
mkdir opencv_all && cd opencv_all
wget -O opencv.tar.gz https://github.com/opencv/opencv/archive/4.0.0.tar.gz
tar xf opencv.tar.gz
wget -O opencv_contrib.tar.gz https://github.com/opencv/opencv_contrib/archive/4.0.0.tar.gz
tar xf opencv_contrib.tar.gz
rm *.tar.gz

export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig:/usr/share/pkgconfig
export PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig:/usr/share/pkgconfig

cd opencv-4.0.0
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/opt/opencv-4.0.0 \
    -D CMAKE_TOOLCHAIN_FILE=../platforms/linux/arm-gnueabi.toolchain.cmake \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_all/opencv_contrib-4.0.0/modules \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D PYTHON2_INCLUDE_PATH=/usr/include/python2.7 \
    -D PYTHON2_LIBRARIES=/usr/lib/arm-linux-gnueabihf/libpython2.7.so \
    -D PYTHON2_NUMPY_INCLUDE_DIRS=/usr/lib/python2/dist-packages/numpy/core/include \
    -D PYTHON3_INCLUDE_PATH=/usr/include/python3.5m \
    -D PYTHON3_LIBRARIES=/usr/lib/arm-linux-gnueabihf/libpython3.5m.so \
    -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/python3/dist-packages/numpy/core/include \
    -D BUILD_OPENCV_PYTHON2=ON \
    -D BUILD_OPENCV_PYTHON3=ON \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D WIDTH_GTK=ON \
    -D BUILD_TESTS=OFF \
    -D BUILD_DOCS=OFF \
    -D BUILD_EXAMPLES=OFF ..

make -j16
make install/strip
cd /opt
tar -cjvf ~/opencv-4.0.0-armhf.tar.bz2 opencv-4.0.0
cd ~

git clone https://gist.github.com/sol-prog/ed383474872958081985de733eaf352d opencv_cpp_compile_settings
cd opencv_cpp_compile_settings
cp opencv.pc ~
cd ~
