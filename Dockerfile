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
RUN python3 -m pip install networkx==2.4
RUN python3 -m pip install numpy==1.16.4
RUN python3 -m pip install pandas==0.24.2
RUN python3 -m pip install scipy==1.3.0
RUN python3 -m pip install scikit-learn==0.21.2
RUN python3 -m pip install scikit-optimize==0.5.2
RUN python3 -m pip install seaborn==0.9.0

# Create notebook user
ENV NB_USER=nagyd96
RUN adduser $NB_USER

# Create working directory
ENV WORKDIR=/home/$NB_USER/workdir
RUN if [ ! -d $WORKDIR ]; then mkdir $WORKDIR; fi

# Setup matplotlibrc file for dark theme
COPY ./matplotlibrc_dark /home/$NB_USER/
ENV MPL_RC_FILE_DARK=/home/$NB_USER/matplotlibrc_dark

# Copy startup script
COPY ./set_theme.sh /home/$NB_USER/

# Copy notebook config script
COPY ./init_notebook.sh /home/$NB_USER/

# Fix permissions
RUN chown -R ${NB_USER}: /tmp && chmod -R u+rwx /tmp
RUN chown -R ${NB_USER}: /home && chmod -R u+rwx /home
RUN chown -R ${NB_USER}: /usr/local && chmod -R u+rwx /usr/local

# No more need to switch user since we are using docker-entrypoint.sh
# USER $NB_USER

# Run Jupyter notebook via docker-entrypoint.sh
COPY docker-entrypoint.sh /usr/local/bin/
# backwards compat
RUN ln -s /usr/local/bin/docker-entrypoint.sh /
ENTRYPOINT ["docker-entrypoint.sh"]
