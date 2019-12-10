#!/bin/bash
sudo -H -u $NB_USER bash -c '/home/${NB_USER}/init_notebook.sh || echo "ERROR: init_notebook.sh failed"'
sudo -H -u $NB_USER bash -c '/home/${NB_USER}/set_theme.sh || echo "ERROR: set_theme.sh failed"'
sudo -H -u $NB_USER bash -c 'cd $WORKDIR && nohup sh -c "jupyter notebook --ip=0.0.0.0 --no-browser" > /home/$NB_USER/jupyter.log &'
/bin/bash
