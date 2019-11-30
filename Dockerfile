FROM nagyd96/ubuntu:xenial-20191108
FROM python:3.8.0
ENV NBUSER=nagyd96
RUN adduser $NBUSER
RUN python3 -m pip install --upgrade pip && python3 -m pip install jupyter
RUN python3 -m pip install install RISE

USER $NBUSER
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]
