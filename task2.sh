
echo "Select Option (1,2,3,4,exit)"
echo ""
read option


case $option in
'1')#-------------------------------------------------------
	echo "Option 1 selected"
	echo "Input file name with extension"
	read f
	permission=$(stat -c%a "$f")
	echo "Current permission of the file"
	echo $permission
	temp=777
	permission=$(($temp-$permission))		#777-current permission
	chmod $(($permission)) "$f"
	echo "Updated Permission after inversion"
	echo $(stat -c%a "$f")
;;

'2')#--------------------------------------------------------
	echo "Option 2 selected"
	echo "Input file name with extension"
	read f
	echo "Enter string to search"
	read word
	echo "Lines containing the word"
	grep "$word" "$f"
;;


'3')#---------------------------------------------------------
	echo "Option 3 selected"
	touch "dummy.txt"
	
	echo "Enter value of N"
	read n
	
	x=0
	for f in *.*
 	do
  		z=$((x%2))
  		if [ $z -eq 0 ]; then
  			echo $f " :even position"
  			head -$n "$f" >> "dummy.txt" #adds to the start
  		else
  			echo $f " :odd position"
   			tail -$n "$f" >> "dummy.txt"	#added to the end
  		fi
  	x=$((x+1))
 	done
 	
 	echo $""
 	echo "Dummy.txt is created and $n lines of each file is copied"

;;


'4')#---------------------------------------------------------
	echo "Option 4 selected"
	echo "Input file name with extension"
	read f
	echo "Current modified time"
	echo $(date -r "$f")
	x1=$(date -r "$f" +%s)                  
 	x2=$(date +%s)                          
 	x3=$((x2-86400))		#to check for 24 hours
 	if [ $x3 -gt $x1 ]; then	#if file was not modified in 24 hours
 		echo "modified time updated" 	
 		touch "$f"
 		echo $(date -r "$f")
 	else
 		echo "modified time not updated"
 	fi		 	
;;

'exit')
	exit
;;

*)
echo "INVALID INPUT"
esac
