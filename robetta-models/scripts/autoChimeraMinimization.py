## # # !/usr/bin/env python2  # Chimera's python is used...
#------------------------------------------------------------------------------
# file: autoChimeraMinimization.py
# author: Jon David
# date: Monday, July 6, 2020
# description:
#   This is a Chimera script. Automates Chimera's structure minimization
#   process for a single PDB.
#------------------------------------------------------------------------------
# usage:
#   chimera --nogui --script "autoChimeraMinimization.py <inPDB> <outPDB>"
#------------------------------------------------------------------------------
# notes:
#   Chimera documentation:
#     cgl.ucsf.edu/chimera/current/docs/UserGuide/framecontrib.html  
#------------------------------------------------------------------------------


import sys
import chimera
import Midas
from DockPrep import prep
from chimera import runCommand


USAGE = '''
  USAGE: automateMinimization.py <inputPDB> <outputPDB>
  
  Where,
    inputPDB :: an existing PDB file to minimize
    outputPDB :: PDB file to write the minimized structure to
'''

def runLoadPDB(inPDB):
  runCommand("open {}".format(inPDB))
  return

def runAddH():
  runCommand('addh inIsolation true hbond true useHisName true')
  return


def runAddCharge():
  #  runCommand('addcharge std chargeModel ff14SB')
  runCommand('addcharge std chargeModel 99sb')
  #  runCommand('addcharge nonstd method am1-bcc')
  #runCommand('addcharge nonstd method am1-bcc')
  return

def runDockPrep():
  models = chimera.openModels.list(modelTypes=[chimera.Molecule])
  prep(models)
  #prep(models, hisScheme=None, mutateMSE=True, mutate5BU=True, mutateUMS=True,
  #     mutateUMS=True, mutateCSL=True, delSolvent=True, delIons=False,
  #     delLigands=False, delAltLocs=True, incompleteSideChains='rotamers',
  #     nongui=False, rotamerLib='Dunbrack', rotamerPreserve=True,
  #     memorize=False, memorizeName=None)
  return

def runMinimization():
  runCommand('minimize nsteps 100 stepsize 0.02 cgsteps 10 cgstepsize 0.02 interval 10')
  return

def runSavePDB(outfPDB):
  runCommand("write #0 {}".format(outfPDB))
  return


# TODO: set where to write replyLog
# TODO: load PDB

## sys.argv[0]  name of script
print( "(debug) script name: ".format(sys.argv[0]) )
if len(sys.argv) < 3:
  print(USAGE)
print( "(debug) arg1: {}".format(sys.argv[1]) )
print( "(debug) arg2: {}".format(sys.argv[2]) )
  
inPDB = sys.argv[1]
outPDB = sys.argv[2]

runLoadPDB(inPDB)
runAddH()
runAddCharge()
runDockPrep()
runMinimization()
runSavePDB(outPDB)

