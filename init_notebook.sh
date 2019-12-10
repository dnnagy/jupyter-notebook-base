#!/bin/bash
# echo "Writing up jupyter notebook settings..."
# JP_CONFIG_DIR=$(ipython locate profile) # It was $(jupyter --config-dir)
# if [[ ! -d ${JP_CONFIG_DIR} ]] || [[ ! -d ${JP_CONFIG_DIR}/custom ]]; then
#     mkdir -p ${JP_CONFIG_DIR}/custom
# fi
# NB_CONFIG="define([\
#     'base/js/namespace',\
#     'base/js/events'\
#     ],\
#     function(IPython, events) {\
#         events.on('app_initialized.NotebookApp',\
#             function () {\
#                 IPython.Cell.options_default.cm_config.lineNumbers = true;\
#             }\
#         );\
#     }\
# );"
# echo ${NB_CONFIG} > ${JP_CONFIG_DIR}/custom/custom.js

# Another solution since the above does not work
NB_CONFIG_DIR=/home/${NB_USER}/.jupyter/nbconfig
NB_CONFIG_JSON='{"CodeCell":{"cm_config":{"lineNumbers": true}}}'
if [[ ! -d ${NB_CONFIG_DIR} ]]; then
    mkdir -p ${NB_CONFIG_DIR}
fi
echo ${NB_CONFIG_JSON} > ${NB_CONFIG_DIR}/notebook.json
