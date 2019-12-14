FROM nagyd96/ubuntu:xenial-20191108

# Versions above this fail
FROM python:3.6.8

# Install nano
RUN apt-get update && apt-get install -y nano htop

# Install Jupyter Notebook with RISE
RUN python3 -m pip install --upgrade pip

# Colored outputs in bash
ENV RED='\033[0;31m'
ENV NC='\033[0m'

# Install requirements from requirements.txt
COPY requirements.txt /tmp/
RUN cat /tmp/requirements.txt | xargs -n 1 pip install --force-reinstall || echo -e "${RED}ERROR: pip install failed. See above.${NC}"

# Create notebook user
ENV NB_USER=nagyd96
RUN adduser $NB_USER

# Create working directory
ENV WORKDIR=/home/$NB_USER/workdir
RUN if [ ! -d $WORKDIR ]; then mkdir $WORKDIR; fi

# Setup matplotlibrc file for dark theme
COPY ./matplotlibrc_dark /home/$NB_USER/
ENV MPL_RC_FILE_DARK=/home/$NB_USER/matplotlibrc_dark

# Copy notebook config
RUN mkdir -p /home/$NB_USER/.jupyter/
COPY ./jupyter_notebook_config.json /home/$NB_USER/.jupyter/

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
RUN chmod u+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT /usr/local/bin/docker-entrypoint.sh
