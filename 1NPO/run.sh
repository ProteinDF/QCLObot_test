#!/bin/bash

pdb2brd.py 1NPO.model.pdb 1NPO.model.brd
QCLObot.py -l logconfig.ini 1NPO.model.QCLO.yaml $* 


