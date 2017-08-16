#!/bin/bash
EXEC_DIR=$PWD
CMD=$0

if [ "${CMD:0:1}" == "/" ]
then
    # absolute path
    SCRIPTS_DIR=`dirname ${CMD}`

else
    # relative path
    SCRIPTS_DIR=`dirname $( realpath $PWD/${CMD} )`

fi
ROOT_DIR=`dirname $SCRIPTS_DIR`

mkdir ${ROOT_DIR}/builds
mkdir ${ROOT_DIR}/install
cd $ROOT_DIR/builds

${SCRIPTS_DIR}/install_libsbml.sh
${SCRIPTS_DIR}/install_libnuml.sh

cp ${ROOT_DIR}/install/lib/python2.7/site-packages/libnuml/{libnuml.py,_libnuml.so} ${ROOT_DIR}/libnuml/

cd $EXEC_DIR


