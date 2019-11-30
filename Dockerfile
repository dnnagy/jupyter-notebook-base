FROM nagyd96/ubuntu:xenial-20191108
FROM python:3.8.0

# Install Jupyter Notebook with RISE
RUN python3 -m pip install --upgrade pip && python3 -m pip install jupyter
RUN python3 -m pip install RISE

# Create notebook user
ARG NB_USER=nagyd96
RUN adduser $NB_USER

# Create working directory
ENV WORKDIR=/home/$NB_USER/workdir
RUN if [ ! -d $WORKDIR ]; then mkdir $WORKDIR; fi
RUN chmod -R 777 /home

# Run the notebook from workdir
WORKDIR $WORKDIR
USER $NB_USER
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]
