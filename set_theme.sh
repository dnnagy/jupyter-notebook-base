#!/bin/bash
if [[ -n ${THEME} ]]; then
    echo "Changing to theme ${THEME}."
    jt -t $THEME -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T -N
else
    echo "Resetting theme."
    jt -r
fi
if [[ ${PLT_DARK_THEME:-0} -eq 1 ]]; then
    MPL_RC_FILE=$(python -c "import matplotlib; print(matplotlib.matplotlib_fname())")
    # Create a backup
    cp MPL_RC_FILE /home/${NB_USER}/matplotlibrc.backup
    # Write the content of my matplotlibrc file into the original one
    if [[ -n ${MPL_RC_FILE_DARK} ]]; then
        echo "ERROR: Environment variable MPL_RC_FILE_DARK must exist"; exit -1
    fi
    # Check if file size > 0
    if [[ -s ${MPL_RC_FILE_DARK} ]]; then
        echo "ERROR: File ${MPL_RC_FILE_DARK} must not be empty"; exit -1
    fi
    cat ${MPL_RC_FILE_DARK} > MPL_RC_FILE
fi
