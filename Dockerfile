FROM ruby:2.2
MAINTAINER Markus Klepp <docker@mklepp.com>
RUN apt-get update -qq && apt-get install -y unzip cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.10/opencv-2.4.10.zip/download -O /tmp/opencv-2.4.10.zip
RUN unzip /tmp/opencv-2.4.10.zip -d /tmp/
RUN mkdir /tmp/opencv-2.4.10/release
RUN cd /tmp/opencv-2.4.10/release && cmake -D WITH_FFMPEG=0 -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. && make && make install
RUN gem install ruby-opencv -v 0.0.14 -- --with-opencv-dir=/usr/local
RUN rm -rf /tmp/opencv-2.4.10
