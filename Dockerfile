FROM debian:stretch

RUN apt -y update
RUN apt -y upgrade
RUN dpkg --add-architecture armhf
RUN apt -y update
RUN apt -y install qemu-user-static
RUN apt -y install python3:armhf
RUN apt -y install python3-dev:armhf
RUN apt -y install python3-numpy:armhf
RUN apt -y install python-dev:armhf
RUN apt -y install python-numpy:armhf
RUN apt -y install libgtk-3-dev:armhf libcanberra-gtk3-dev:armhf
RUN apt -y install libtiff-dev:armhf zlib1g-dev:armhf
RUN apt -y install libjpeg-dev:armhf libpng-dev:armhf
RUN apt -y install libavcodec-dev:armhf libavformat-dev:armhf libswscale-dev:armhf libv4l-dev:armhf
RUN apt -y install libxvidcore-dev:armhf libx264-dev:armhf
RUN apt -y install crossbuild-essential-armhf
RUN apt -y install gfortran-arm-linux-gnueabihf
RUN apt -y install cmake git pkg-config
RUN apt -y install wget

COPY ./docker-entrypoint.sh /
RUN chmod +x ./docker-entrypoint.sh
RUN ./docker-entrypoint.sh
CMD ["bash"]
