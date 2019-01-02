#!/bin/bash
#$ -q haswell1.q
#$ -cwd
#$ -N QCLO.model.2MGO
#$ -j y
#$ -o out.txt
#$ -pe smp 4

export AMBERHOME=/opt/amber18
source ${AMBERHOME}/amber.sh

# ---------------------------------------------------------------------
# anyenv
# ---------------------------------------------------------------------
export ANYENV_ROOT=/mnt/ds1817p1/hirano/dot.anyenv

if [ x${ANYENV_ROOT} != x -a -d "${ANYENV_ROOT}/bin" ]; then
    PATH="${ANYENV_ROOT}/bin:${PATH}"
    eval "$(anyenv init - zsh)"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi
# ---------------------------------------------------------------------

export PDF_HOME="/mnt/ds1817p1/hirano/local/PDF.2018.10"
export PATH=${PDF_HOME}/bin:${PATH}

# ---------------------------------------------------------------------
# main
# ---------------------------------------------------------------------
if [ "x${SGE_O_WORKDIR}" != x ]; then
    cd $SGE_O_WORKDIR
fi

QCLObot_modeler.py -d modeling.yml 2>&1 | tee out.qclo

