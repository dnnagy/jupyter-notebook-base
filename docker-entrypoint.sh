#!/bin/bash
su $NB_USER bash -c '/home/${NB_USER}/set_theme.sh || echo -e "${RED}ERROR: set_theme.sh failed.${NC}"'
# WARNING: The init_notebook.sh must be run after set_theme.sh!
su $NB_USER bash -c '/home/${NB_USER}/init_notebook.sh || echo -e "${RED}ERROR: init_notebook.sh failed.${NC}"'
su $NB_USER bash -c 'cd $WORKDIR && nohup sh -c "jupyter notebook --ip=0.0.0.0 --no-browser" > /home/$NB_USER/jupyter.log &'
su $NB_USER bash -c 'sleep 1s'
/bin/bash
