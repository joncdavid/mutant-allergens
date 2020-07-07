#!/usr/bin/env bash
#------------------------------------------------------------------------------
# file: autoChimeraMinimization.sh
# author: Jon David
# date: Tuesday, July 7, 2020
# description:
#   This is a wrapper for running autoChimeraMinimization.py,
#   a Chimera scripts.
#------------------------------------------------------------------------------
# usage:
#   autoChimeraMinimization.sh <inPDB> <outPDB> <outReplyLog>
#------------------------------------------------------------------------------
# requirements:
#   * chimera must be visible from $PATH environment variable.
#   * autoChimeraMinimization.py must exist in the same directory.
#------------------------------------------------------------------------------

PATH_TO_THIS_SCRIPT=$0
SCRIPT_DIR=`dirname $PATH_TO_THIS_SCRIPT`

inPDB=$1
outPDB=$2
outReplyLog=$3

echo "PATH_TO_THIS_SCRIPT: ${PATH_TO_THIS_SCRIPT}"
echo "SCRIPT_DIR: ${SCRIPT_DIR}"
echo "inPDB: ${inPDB}"
echo "outPDB: ${outPDB}"
echo "outReplyLog: ${outReplyLog}"

chimera --nogui --script "${SCRIPT_DIR}/autoChimeraMinimization.py ${inPDB} ${outPDB}" > ${outReplyLog}
