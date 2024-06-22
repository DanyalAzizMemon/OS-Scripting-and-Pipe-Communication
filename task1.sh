

echo Alignment : $1
echo Size : $2

V1=$1
num=$2


if [[ $2 -lt 1 ]] || [[ $2 -gt 1000000000 ]];then	#checking the size input
	echo "Invalid size"
	exit
fi

case $1 in
'left')#------------------------------------------left diamond
   for ((i=1;i<=$num;i++))
   do
   	for((j=0;j<i-1;j++))
   	do
   		echo -n "*"	#-n prints in same line
   	done
   	
   	echo $""		#$ for next line
   done	

	#------used to print the lower end
   for ((i=1;i<=$num;i++))
   do
   	for((j=i;j<=$num;j++))
   	do
   		echo -n "*"	#-n prints in same line
   	done
   	
   	echo $""		#$ for next line
   done	
;;

'right')#---------------------------------------------rigt diamond
   for ((i=1;i<=$num;i++))
    do

    	for ((j=$num;j>=i;j--))		#for printing spaces
    	do
    		echo -n " "
    	done
    	
    	for ((k=1;k<=i;k++))		#pattern
    	do
    		echo -n "*"
    	done
   echo "" 	
   done
   
		#--------------lower triangle   
   
    for ((i=1;i<=$num;i++))
    do

    	for ((j=0;j<=i;j++))
    	do
    		echo -n " "
    	done
    	
    	for ((k=$num-i;k>0;k--))
    	do
    		echo -n "*"
    	done
   echo "" 	
   done
;;


'full')#-------------------------------------full diamond

  for ((i=1;i<=$num;i++))
    do

    	for ((j=$num;j>=i;j--))		#for printing spaces
    	do
    		echo -n " "
    	done
    	
    	for ((k=1;k<=2*i-1;k++))		#pattern
    	do
    		echo -n "*"	
    	done
   echo "" 	
   done
   
    for ((i=1;i<=$num;i++))
    do

    	for ((j=0;j<=i;j++))
    	do
    		echo -n " "
    	done
    	
    	for ((k=1; k <= 2*($num-i)-1;k++))
    	do
    		echo -n "*"
    	done
   echo "" 	
   done
;;

*)
echo "Invalid alignment"
esac

