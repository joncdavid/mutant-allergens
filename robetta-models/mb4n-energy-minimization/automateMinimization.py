## # # !/usr/bin/env python2
#--------------------------------------------------------
# file: automateMinimization.py
# author: Jon David
# date: Monday, July 6, 2020
# description:
#   Automate Chimera's structure minimization process
#--------------------------------------------------------


import chimera
import Midas
from chimera import runCommand


def runAddH():
  runCommand('addh inIsolation true hbond true useHisName true')
  return


def runAddCharge():
  #  runCommand('addcharge std chargeModel ff14SB')
  runCommand('addcharge std chargeModel 99sb')
  #  runCommand('addcharge nonstd method am1-bcc')
  #runCommand('addcharge nonstd method am1-bcc')
  return

def runMinimization():
  runCommand('minimize nsteps 100 stepsize 0.02 cgsteps 10 cgstepsize 0.02 interval 10')
  return

# TODO: set where to write replyLog
# TODO: load PDB
runAddH()
runAddCharge()
runMinimization()
# TODO: save minimized PDB
