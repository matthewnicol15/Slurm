#!/bin/bash

for NUMBER in `seq 10 69`;

do

rm process_d_pip_pim_PID"$NUMBER".sh

touch process_d_pip_pim_PID"$NUMBER".sh

echo 'gROOT->ProcessLine(".L Tree_maker_RGB_d_pip_pim_spring19_62_599_PID.C++");' >> process_d_pip_pim_PID"$NUMBER".sh
echo 'gROOT->ProcessLine("Tree_maker_RGB_d_pip_pim_spring19_62_599_PID(\"/lustre19/expphy/volatile/clas12/rg-b/production/recon/spring2019/torus-1/pass1/v0/dst/train_20200610/inc/inc_006'$NUMBER'*.hipo\",\"RGB_d_pip_pim_spring19_17_12_21_6'$NUMBER'.root\")");' >> process_d_pip_pim_PID"$NUMBER".sh

echo "Made process_d_pip_pim_PID"$NUMBER".sh"

done
