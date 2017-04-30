FROM debian:jessie

RUN apt-get update
RUN apt-get install -y build-essential cmake libusb-1.0.0 libusb-1.0.0-dev git openocd

COPY gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2 /tmp/
RUN cd tmp && bzcat gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2 | tar xf -
RUN cp -R /tmp/gcc-arm-none-eabi-6-2017-q1-update/* /usr/local/

RUN cd tmp; git clone https://github.com/texane/stlink.git
RUN cd /tmp/stlink; make release
RUN cd /tmp/stlink/build/Release; make install; ldconfig

RUN rm -rf /tmp/*