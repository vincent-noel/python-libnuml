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

if [ ! -f ${ROOT_DIR}/libnuml/_libnuml.so ]
then

    mkdir ${ROOT_DIR}/builds
    mkdir ${ROOT_DIR}/install
    cd $ROOT_DIR/builds

    ${SCRIPTS_DIR}/install_libsbml.sh
    ${SCRIPTS_DIR}/install_libnuml.sh

    mkdir -p ${ROOT_DIR}/libnuml
    cp ${ROOT_DIR}/install/lib/python2.7/site-packages/libnuml/libnuml.py ${ROOT_DIR}/
    cp ${ROOT_DIR}/install/lib/python2.7/site-packages/libnuml/_libnuml.so ${ROOT_DIR}/

    cd ${EXEC_DIR}

fi



