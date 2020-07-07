#!/usr/bin/env bash
#------------------------------------------------------------------------------
# file: autoRosettaMinimization.sh
# author: Jon David
# date: Tuesday, July 7, 2020
# description:
#   Uses Rosetta to perform minimization.
#------------------------------------------------------------------------------
# usage:
#   autoRosettaMinimization.sh <inPDB> <outPDB> <outScore>
#------------------------------------------------------------------------------
# requirements:
#   * chimera must be visible from $PATH environment variable.
#------------------------------------------------------------------------------

PATH_TO_THIS_SCRIPT=$0
SCRIPT_DIR=`dirname $PATH_TO_THIS_SCRIPT`

inPDB=$1
outPDB=$2
outScore=$3

inpdbBasename=$(basename "${inPDB}" .pdb)
defaultOutPDB="${inpdbBasename}_0001.pdb"

echo "PATH_TO_THIS_SCRIPT: ${PATH_TO_THIS_SCRIPT}"
echo "SCRIPT_DIR: ${SCRIPT_DIR}"
echo "inPDB: ${inPDB}"
echo "outPDB: ${outPDB}"
echo "outReplyLog: ${outScore}"
echo "inpdbBasename: ${inpdbBasename}"
echo "defaultOutPDB: ${defaultOutPDB}"

minimize.default.macosclangrelease -overwrite -s $inPDB -run:min_type lbfgs_armijo_nonmonotone -run:min_tolerance 0.001
mv score.sc $outScore
mv $defaultOutPDB $outPDB
