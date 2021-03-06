#!/bin/bash -x
ROOT_DIR=${1:? Root dir}
BIN_DIR=${2:? Bin dir}
LIB_DIR=${3:? Lib dir}
DOC_DIR=${4:? Doc dir}

${PYTHON} make_be_images.py

cp be_*.py ${ROOT_DIR}${LIB_DIR}

cat <<EOF >${ROOT_DIR}${BIN_DIR}/bemacs_server
#!${PYTHON}
import sys
sys.path.insert( 0, "${LIB_DIR}" )
import be_main
sys.exit( be_main.main( sys.argv ) )
EOF
chmod +x ${ROOT_DIR}${BIN_DIR}/bemacs_server

cat <<EOF >>${ROOT_DIR}${LIB_DIR}/be_platform_unix_specific.py
library_dir = "${LIB_DIR}"
doc_dir = "${DOC_DIR}"
EOF

mv ${ROOT_DIR}${LIB_DIR}/be_client.py ${ROOT_DIR}${BIN_DIR}/bemacs
chmod +x ${ROOT_DIR}${BIN_DIR}/bemacs
