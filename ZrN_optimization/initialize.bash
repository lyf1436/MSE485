for c1 in $(seq 0.5 0.5 3.0)
do

for c2 in $(seq 0.5 0.5 3.0)
do

foldername=c1_${c1}_c2_${c2}
mkdir ${foldername} 
cp -r inputs/. ${foldername}

cd ${foldername}
sed -i '' 's/Cmin(1,2,1) = 1.2/Cmin(1,2,1) = '"${c1}"'/' ZrN.meam
sed -i '' 's/Cmin(2,1,2) = 1.2/Cmin(2,1,2) = '"${c2}"'/' ZrN.meam

lmp_serial < in.elastic > out.elastic

cd ..

done
done


