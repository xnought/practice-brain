if [[ -e myFile.txt ]]; then
	echo "myFile.txt exists"
else
	echo "myFile.txt does not exist"
fi

if [[ -x `which fsl` ]]; then
	echo "fsl exists"
else
	echo "fsl needs to be downloaded"
fi

cd ../ds000102/sub-01/anat
if [[ -e sub-01_T1w_brain_f02.nii.gz ]]; then
	echo “Skull-stripped brain exists”
else
	echo “Skull-stripped brain does not exist”
fi

cd ../../ # back to ds000102/ root
for i in `seq -w 1 26`; do
	sub="sub-$i"
	cd $sub/anat
	
	if [[ ! -e ${sub}_T1w_f02_brain.nii.gz ]]; then
			echo “Skull-stripped brain doesn’t exist stripping the brain with a fractional intensity threshold of 0.2”
			bet2 ${sub}_T1w.nii.gz ${sub}_T1w_f02_brain.nii.gz -f 0.2
	else
			echo “Skull-Stripped brain already exists doing nothing”
	fi
	
	cd ../../
done
