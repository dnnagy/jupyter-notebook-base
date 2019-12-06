#!/bin/bash
echo "Writing up jupyter notebook settings..."
JP_CONFIG_DIR=$(jupyter --config-dir)
if [[ ! -d ${JP_CONFIG_DIR} ]] || [[ ! -d ${JP_CONFIG_DIR}/custom ]]; then
    mkdir -p ${JP_CONFIG_DIR}/custom
fi
NB_CONFIG="define([\n\
    'base/js/namespace',\n\
    'base/js/events'\n\
    ],\n\
    function(IPython, events) {\n\
        events.on('app_initialized.NotebookApp',\n\
            function () {\n\
                IPython.Cell.options_default.cm_config.lineNumbers = true;\n\
            }\n\
        );\n\
    }\n\
);"
echo ${NB_CONFIG} > ${JP_CONFIG_DIR}/custom/custom.js
