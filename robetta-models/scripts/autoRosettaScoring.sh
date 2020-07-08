#!/usr/bin/env bash
#------------------------------------------------------------------------------
# file: autoRosettaScoring.sh
# author: Jon David
# date: Tuesday, July 7, 2020
# description:
#   Uses Rosetta to perform scoring for a single PDB.
#------------------------------------------------------------------------------
# usage:
#   autoRosettaScoring.sh <inPDB> <outScore>
#
# where,
#   inPDB :: input PDB to calculate scores on
#   outScore :: output score (.sc) file
#
#------------------------------------------------------------------------------
# requirements:
#   * score.default.macosclangrelease
#------------------------------------------------------------------------------

inPDB=$1
outSC=$2

echo "inPDB: ${inPDB}"
echo "outSC: ${outSC}"

score.default.macosclangrelease -in:file:s $inPDB -out:file:scorefile $outSC
