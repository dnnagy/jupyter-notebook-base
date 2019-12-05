#!/bin/bash
JP_CONFIG_DIR=$(jupyter --config-dir)
if [[ ! -d ${JP_CONFIG_DIR} ]] || [[ ! -d ${JP_CONFIG_DIR}/custom ]]; then
    mkdir -p ${JP_CONFIG_DIR}/custom
fi
cd ${JP_CONFIG_DIR}/custom
NB_CONFIG="define([\
    'base/js/namespace',\
    'base/js/events'\
    ],\
    function(IPython, events) {\
        events.on('app_initialized.NotebookApp',\
            function () {\
                IPython.Cell.options_default.cm_config.lineNumbers = true;\
            }\
        );\
    }\
);"
echo ${NB_CONFIG} > ${JP_CONFIG_DIR}/custom/custom.js
cd $WORKDIR