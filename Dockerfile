FROM nagyd96/ubuntu:xenial-20191108

# Versions above this fail
FROM python:3.6.8

# Install nano
RUN apt-get update && apt-get install -y nano

# Install Jupyter Notebook with RISE
RUN python3 -m pip install --upgrade pip && python3 -m pip install jupyter
RUN python3 -m pip install RISE

# Install jupyterthemes
RUN python3 -m pip install jupyterthemes==0.20.0

# Install basic packages
RUN python3 -m pip install matplotlib==3.1.1
RUN python3 -m pip install numpy==1.16.4
RUN python3 -m pip install scipy==1.3.0
RUN python3 -m pip install scikit-learn==0.21.2
RUN python3 -m pip install pandas==0.24.2

# Create notebook user
ENV NB_USER=nagyd96
RUN adduser $NB_USER

# Create working directory
ENV WORKDIR=/home/$NB_USER/workdir
RUN if [ ! -d $WORKDIR ]; then mkdir $WORKDIR; fi
RUN chmod -R 777 /tmp
RUN chmod -R 777 /home

# Run as nagyd96
USER $NB_USER

# Run startup script
COPY startup.sh /home/$NB_USER
CMD /bin/bash /home/$NB_USER/startup.sh
