#!/bin/bash

pdb2brd.py ALA3.pdb ALA3.brd
QCLObot.py -d ALA3_full_senario.yml $* 

