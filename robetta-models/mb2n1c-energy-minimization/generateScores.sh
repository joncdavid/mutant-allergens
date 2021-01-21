#!/usr/bin/env bash
#------------------------------------------------------------
# filename: generateScores.sh
# author: Jon David
# date: Tuesday, January 12, 2021
# description:
#   Given an input PDB,
#     generates a score file before minimization,
#     performs minimization,
#     and generates another score file after minimization
#------------------------------------------------------------
# requirements:
#   a file named minimizer_flags.TEMPLATE
#------------------------------------------------------------

INFIX=49921
MYPDB1=full_model_${INFIX}_1.pdb
MYPDB2=full_model_${INFIX}_2.pdb
MYPDB3=full_model_${INFIX}_3.pdb
MYPDB4=full_model_${INFIX}_4.pdb
MYPDB5=full_model_${INFIX}_5.pdb
SCORE_BIN=score.default.macosclangrelease

genScores() {
  MYPDBF=$1
  MYSCORE_BEFORE=`basename $MYPDBF .pdb`.pre-minimization.sc
  MYSCORE_AFTER=`basename $MYPDBF .pdb`.post-minimization.sc
  
  ## runs scoring on original PDB, and rename score file
  $SCORE_BIN -s $MYPDBF
  mv default.sc $MYSCORE_BEFORE

  ## run minimization
  ##  + generate minimizer_flags file
  ##  + run minimization
  ##  + rename generated score files
  sed "s/TEMPLATE_PDB_FNAME/$MYPDBF/g" minimizer_flags.TEMPLATE > minimizer_flags
  cp minimizer_flags minimizer_flags.$MYPDBF
  minimize.default.macosclangrelease -overwrite @minimizer_flags
  mv score.sc $MYSCORE_AFTER
}

genScores $MYPDB1
genScores $MYPDB2
genScores $MYPDB3
genScores $MYPDB4
genScores $MYPDB5
