
FROM node:18

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:libreoffice/ppa

RUN apt-get install libreoffice-dev -y

WORKDIR /tmp
#RUN wget --no-check-certificate  http://launchpadlibrarian.net/589861954/libreoffice_6.0.7-0ubuntu0.18.04.11_arm64.deb
#RUN wget --no-check-certificate http://downloadarchive.documentfoundation.org/libreoffice/old/7.3.4.2/deb/x86_64/LibreOffice_7.3.4.2_Linux_x86-64_deb.tar.gz -O libo.tar.gz
#RUN apt update \
#  && apt install -y libxinerama1 libfontconfig1 libdbus-glib-1-2 libcairo2 libcups2 libglu1-mesa libsm6
#  && tar -zxvf libo.tar.gz
#WORKDIR LibreOffice_7.3.4.2_Linux_x86-64_deb/DEBS
#RUN dpkg -i *.deb

RUN mkdir /tmp-reports
COPY . /carbone-api
WORKDIR /carbone-api
RUN yarn
CMD node index
