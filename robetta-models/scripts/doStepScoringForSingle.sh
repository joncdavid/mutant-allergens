#!/usr/bin/env bash
#------------------------------------------------------------------------------
# file: doStepScoringForSingle.sh
# author: Jon David
# date: Tuesday, July 7, 2020
# description:
#   This step generates all the scores for a single model, and each of its
#   minimized structures: Rosetta-only minimization, Chimera-only minimization,
#   and also Rosetta-Chimera minimization.
#------------------------------------------------------------------------------
# usage:
#   doStepMinimizationForSingle.sh <originalPDBfile> <baseModelName> <modelName>
#
#   where,
#     originalPDB :: PDB of original Robetta model
#     baseModelName :: name of model without variant number
#     modelName :: name of the model (including variant number)
#------------------------------------------------------------------------------
# example:
#   doStepMinimizationForSingle.sh mb4n/full_model_2334_1.pdb mb4n mb4n_v1
#------------------------------------------------------------------------------
# requirements:
#   * autoRosettaScoring.sh <inPDB> <outSC>
#------------------------------------------------------------------------------

PATH_TO_THIS_SCRIPT=$0
SCRIPT_DIR=`dirname $PATH_TO_THIS_SCRIPT`


## set variables/pathnames/filenames
origPDB=$1
baseModelName=$2
modelName=$3

GEN_PDB_DIR=${SCRIPT_DIR}/../generated-pdbs/${baseModelName}/
GEN_DATA_DIR=${SCRIPT_DIR}/../generated-data/${baseModelName}/

minRosettaPDB=${GEN_PDB_DIR}/${modelName}.minRosetta.pdb
minChimeraPDB=${GEN_PDB_DIR}/${modelName}.minChimera.pdb
minRosettaChimeraPDB=${GEN_PDB_DIR}/${modelName}.minRosettaChimera.pdb

origSC=${GEN_DATA_DIR}/${modelName}.sc
minRosettaSC=${GEN_DATA_DIR}/${modelName}.minRosetta.sc
minChimeraSC=${GEN_DATA_DIR}/${modelName}.minChimera.sc
minRosettaChimeraSC=${GEN_DATA_DIR}/${modelName}.minRosettaChimera.sc


## print variables and check for correctness...
echo "origPDB: ${origPDB}"
echo "baseModelName: ${baseModelName}"
echo "modelName: ${modelName}"
echo "GEN_PDB_DIR: ${GEN_PDB_DIR}"
echo "GEN_DATA_DIR: ${GEN_DATA_DIR}"
echo "minRosettaPDB: ${minRosettaPDB}"
echo "minRosettaSC: ${minRosettaSC}"
echo "minChimeraPDB: ${minChimeraPDB}"
echo "minRosettaChimeraPDB: ${minRosettaChimeraPDB}"


## run Robetta scoring...
${SCRIPT_DIR}/autoRosettaScoring.sh $origPDB $origSC
${SCRIPT_DIR}/autoRosettaScoring.sh $minRosettaPDB $minRosettaSC
${SCRIPT_DIR}/autoRosettaScoring.sh $minChimeraPDB $minChimeraSC
${SCRIPT_DIR}/autoRosettaScoring.sh $minRosettaChimeraPDB $minRosettaChimeraSC
