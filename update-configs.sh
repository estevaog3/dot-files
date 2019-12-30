N_FILES=`cat ./.paths | wc -l`
for i in {1..$N_FILES}; do
	PATH_AND_FILE=`cat ./.paths | awk -v line=$i '{if(NR == line) {print $0;}}'`
	echo $PATH_AND_FILE
	NAME=`echo $PATH_AND_FILE | awk -F"/" '{print $NF}'`
	cp $PATH_AND_FILE ./config-files/$NAME
done
