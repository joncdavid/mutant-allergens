## # # !/usr/bin/env python2  # Chimera's python is used...
#------------------------------------------------------------------------------
# file: autoChimeraRMSD.py
# author: Jon David
# date: Tuesday, July 7, 2020
# description:
#   This is a Chimera script. Aligns two structures using matchmaker
#   and then calculates their RMSD.
#------------------------------------------------------------------------------
# usage:
#   chimera --nogui --script "autoChimeraRMSD.py <refStruct> <matchSTruct> <outReplyLog>"
#------------------------------------------------------------------------------
# notes:
#   Chimera documentation:
#     cgl.ucsf.edu/chimera/current/docs/UserGuide/framecontrib.html
#   The default alignment algorithm is Needleman-Wunsch
#------------------------------------------------------------------------------


import sys
import chimera
import Midas
from chimera import runCommand


USAGE = '''
  USAGE:

    chimera --nogui --script "autoChimeraRMSD.py <refStruct> <matchStruct>"
  
  Where,
    refStruct :: PDB file (reference)
    matchStruct :: PDB file (mobile)

'''

refPDB = sys.argv[1]
matchPDB = sys.argv[2]


Midas.open(refPDB)
Midas.open(matchPDB)
runCommand("mmaker #0 #1")

