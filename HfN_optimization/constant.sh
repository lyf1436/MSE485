#! /bin/bash
for c1 in $(seq 0.3 0.3 2.4)
do

for c2 in $(seq 0.3 0.3 2.4)
do
foldername=c1_${c1}_c2_${c2}
cd ${foldername}

C11=$(grep C11 out.elastic | cut -d ' ' -f 5)
C12=$(grep C12 out.elastic | cut -d ' ' -f 5)
C44=$(grep C44 out.elastic | cut -d ' ' -f 5)
lattice=$(grep constant out.elastic | cut -d ' ' -f 5)

echo $c1 $c2 $C11 $C12 $C44 $lattice

cd ../

done
done

