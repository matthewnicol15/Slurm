#!/bin/bash

for NUMBER in `seq 5032 5419`;

do

rm process_FTOF"$NUMBER".sh

touch process_FTOF"$NUMBER".sh

echo 'gROOT->ProcessLine(".L FTOF_Unified_2D.C++");' >> process_FTOF"$NUMBER".sh
echo 'gROOT->ProcessLine("FTOF_Unified_2D(\"/cache/clas12/rg-a/production/recon/fall2018/torus-1/pass1/v0/dst/recon/00'$NUMBER'/*.hipo\",\"/volatile/clas12/matthewn/FTOF/RGA_Fall18_Inbending_'$NUMBER'.root\")");' >> process_FTOF"$NUMBER".sh

echo "Made process_FTOF"$NUMBER".sh"

done
