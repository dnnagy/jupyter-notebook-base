FROM nagyd96/ubuntu:xenial-20191108
FROM python:3.8.0

# Install Jupyter Notebook with RISE
RUN python3 -m pip install --upgrade pip && python3 -m pip install jupyter
RUN python3 -m pip install RISE

# Create notebook user
ARG NB_USER=nagyd96
RUN adduser $NBUSER

# Create working directory
ENV WORKDIR=/home/$NBUSER/workdir
RUN if [ ! -d $WORKDIR ]; then mkdir $WORKDIR; fi
RUN chmod -R 777 /home

# Run the notebook from workdir
WORKDIR $WORKDIR
USER $NBUSER
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]

