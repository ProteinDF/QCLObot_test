#!/bin/bash
#$ -q haswell1.q
#$ -pe smp 4
#$ -cwd
#$ -N Q.1NPO
#$ -j y
#$ -o serial.txt
 
if [ x$SGE_O_WORKDIR != x ]; then
    cd $SGE_O_WORKDIR
fi

source ${HOME}/dotfile/share/dot.envrc.201704

${PDF_HOME}/bin/pdb2brd.py 1NPO.model.pdb 1NPO.model.brd
${PDF_HOME}/bin/QCLObot.py -l logconfig.ini 1NPO.model.QCLO.yaml $* 


