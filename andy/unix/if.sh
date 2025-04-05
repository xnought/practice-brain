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

                      
