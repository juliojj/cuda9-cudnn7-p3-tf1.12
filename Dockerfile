FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

# fix cudnn version
USER root
RUN apt-get update && apt-get install -y --allow-downgrades --no-install-recommend$
libcudnn7=7.0.5.15-1+cuda9.1 \
libcudnn7-dev=7.0.5.15-1+cuda9.1 && \
rm -rf /var/lib/apt/lists/*
RUN apt-get update

# install python3
RUN apt-get update
RUN apt-get install software-properties-common

# instap pip
RUN apt-get install python3-pip

# install numpy
RUN pip3 --no-cache-dir install -U numpy==1.14.5

# install tensorflow (1.4.1 to work with cuda8 and cudnn 6)
RUN pip3 install tensorflow-gpu==1.12.0

# install other libraries
RUN pip3 install pandas
RUN pip3 install scipy
RUN pip3 install matplotlib
RUN pip3 install sklearn
RUN pip3 install psutil
RUN pip3 install pyyaml

# create a link to use python3 as as 'python'
RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /app/codalab/
