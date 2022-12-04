for c1 in $(seq 0 1.2 2.4)
do

for c2 in $(seq 0 1.2 2.4)
do

foldername=c1_${c1}_c2_${c2}
mkdir ${foldername} 
cp -r inputs/. ${foldername}

cd ${foldername}
sed -i '' 's/Cmin(1,2,1) = 1.2/Cmin(1,2,1) = '"${c1}"'/' HfN.meam
sed -i '' 's/Cmin(2,1,2) = 1.2/Cmin(2,1,2) = '"${c2}"'/' HfN.meam

lmp_serial < in.elastic > out.elastic

cd ..

done
done


