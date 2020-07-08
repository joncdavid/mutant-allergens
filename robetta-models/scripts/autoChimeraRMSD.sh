## # # !/usr/bin/env python2  # Chimera's python is used...
#------------------------------------------------------------------------------
# file: autoChimeraRMSD.sh
# author: Jon David
# date: Tuesday, July 7, 2020
# description:
#   This is a Chimera script. Aligns two structures using matchmaker
#   and then calculates their RMSD.
#------------------------------------------------------------------------------
# usage:
#   autoChimeraRMSD.sh <refStruct> <matchSTruct> <outReplyLog>
#------------------------------------------------------------------------------
# require:
#    chimera --nogui --script "autoChimeraRMSD.py <refStruct> <matchStruct>"
#------------------------------------------------------------------------------
# notes:
#   Chimera documentation:
#     cgl.ucsf.edu/chimera/current/docs/UserGuide/framecontrib.html
#   The default alignment algorithm is Needleman-Wunsch
#------------------------------------------------------------------------------


PATH_TO_THIS_SCRIPT=$0
SCRIPT_DIR=`dirname $PATH_TO_THIS_SCRIPT`

refPDB=$1
matchPDB=$2
outReplyLog=$3

echo "PATH_TO_THIS_SCRIPT: ${PATH_TO_THIS_SCRIPT}"
echo "SCRIPT_DIR: ${SCRIPT_DIR}"
echo "refPDB: ${refPDB}"
echo "matchPDB: ${matchPDB}"
echo "outReplyLog: ${outReplyLog}"

chimera --nogui --script "${SCRIPT_DIR}/autoChimeraRMSD.py ${refPDB} ${matchPDB}" > ${outReplyLog}


  

