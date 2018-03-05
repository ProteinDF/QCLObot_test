#!/bin/bash
${PDF_HOME}/bin/pdb2brd.py ALA3.pdb ALA3.brd
${PDF_HOME}/bin/QCLObot.py -d ALA3_full_senario.yml $* 



