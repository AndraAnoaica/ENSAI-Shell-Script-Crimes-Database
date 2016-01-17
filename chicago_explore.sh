#!/bin/bash

# Transfering the data into another document that does not contain the header.

b=crimes.csv
sed '1d' $b > crimes2.csv
b=crimes2.csv

# Using GETOPTS to parse the arguments.

while getopts hvflcrtdomT:D:Y:O:R:A:M:E:GI flag; do

	case $flag in
	
# Text Formatting, Colors and Highlights used:-  
# 1) \e[1m and \033[1m to make the text BOLD.
# 2) \e[4m and \033[4m to make underlined text.
# 3) \e[32m and \033[32m to make color of text Green.
# 4) \e[33m and \033[33m to make color of text Yellow.
# 5) \e[92m and \033[92m to make color of text Light Green.
# 6) \e[93m and \033[93m to make color of text Light Yellow.
# 7) \e[41m and \033[41m to highlight the text in Red.
# 8) \e[42m and \033[42m to highlight the text in Green.
# 9) \e[43m and \033[43m to highlight the text in Yellow.
# 10) \e[44m and \033[44m to highlight the text in Blue.
# 11) \e[45m and \033[45m to highlight the text in Magenta.
# 12) \e[46m and \033[46m to highlight the text in Cyan.
# 13) \e[100m and \033[100m to highlight the text in Dark Gray.
# 14) \e[101m and \033[101m to highlight the text in Light Red.
# 15) \e[102m and \033[102m to highlight the text in Light Green.
# 16) \e[103m and \033[103m to highlight the text in Light Yellow.
# 17) \e[104m and \033[104m to highlight the text in Light Blue.
# 18) \e[105m and \033[105m to highlight the text in Light Magenta.

# -h Help displays the information for all the arguments.

	h)
		echo -e "\e[34m==============================================\e[0m\n"    
		echo -e "\e[44m\e[1mHelp\e[0m\n"
		echo -e "\e[34m==============================================\e[0m \n"
		
# -e option of the echo command enables the parsing of the escape sequences.

# The ”\e[0m” sequence marks end of attributes (formatting and colors).

		
# Help - Basic Information

		echo -e "\e[44m\e[1mBasic Information\e[0m\n"

		
		echo -e "\e[41m\e[1mh\e[0m  \e[92mShow basic help message and exit.\e[0m\n"
	
		echo -e "\e[41m\e[1mv\e[0m  \e[92mShow program's authors and exit.\e[0m\n"
	
		echo -e "\e[41m\e[1mf\e[0m  \e[92mPath to the dataset file.\e[0m\n"
		
# Help - Basic Operations		

		echo -e "\e[44m\e[1mBasic Operations\e[0m\n"
		

		echo -e "\e[41m\e[1ml\e[0m  \e[92mPrints IDs, case numbers, dates, primary types, descriptions, blocks and GPS coordinates of crimes.\e[0m\n"
	
		echo -e "\e[41m\e[1mc\e[0m  \e[92mPrints number of crimes.\e[0m\n"
	
		echo -e "\e[41m\e[1mr\e[0m  \e[92mPrints the crime solving rate.\e[0m\n"

		
# Help - Dataset Exploration

		echo -e "\e[44m\e[1mDataset Exploration\e[0m\n"
		
		

		echo -e "\e[41m\e[1mt\e[0m  \e[92mList all different primary types of crimes.\e[0m\n"
		
		echo -e "\e[41m\e[1md\e[0m  \e[92mList all different descriptions of crimes.\e[0m\n"

		echo -e "\e[41m\e[1mo\e[0m \e[92mLists all different blocks where crimes occurred.\e[0m\n"

		echo -e "\e[41m\e[1mm\e[0m \e[92mLists all different locations where crimes occurred.\e[0m\n"


# Help - Filters
		
		echo -e "\e[44m\e[1mFilters\e[0m\n"



		echo -e "\e[41m\e[1mT\e[0m \e[93m<primarytype>\e[0m  \e[92mFilter results on crimes where the primary type is <primarytype>.\e[0m\n"
	
		echo -e "\e[41m\e[1mD\e[0m \e[93m<description>\e[0m  \e[92mFilter results on crimes where the description is <description>.\e[0m\n"
	
		echo -e "\e[41m\e[1mY\e[0m \e[93m<year>\e[0m \e[92mFilter results on crimes which happened during year <year>.\e[0m\n"
	
		echo -e "\e[41m\e[1mA\e[0m \e[93myes\e[0m \e[92mFilter results on crimes for which a person was arrested.\e[0m\n"
	
		echo -e "\e[41m\e[1mA\e[0m \e[93mno\e[0m \e[92mFilter results on crimes for which no one was arrested.\e[0m\n"

		echo -e "\e[41m\e[1mO\e[0m \e[93m<block>\e[0m \e[92mFilters results on crimes which occurred on a specific block.\e[0m\n"

		echo -e "\e[41m\e[1mM\e[0m \e[93m<location>\e[0m \e[92mFilters results on crimes which occurred on a specific location.\e[0m\n"

		echo -e "\e[41m\e[1mR\e[0m \e[93myes\e[0m \e[92mFilter results on crimes which were domestic.\e[0m\n"
		
		echo -e "\e[41m\e[1mR\e[0m \e[93mno\e[0m \e[92mFilter results on crimes which were not domestic.\e[0m\n"
	
		echo -e "\e[41m\e[1mE\e[0m  \e[93mN\e[0m \e[92mFilter results on crimes which occurred during the night.\e[0m\n"

		echo -e "\e[41m\e[1mE\e[0m  \e[93mD\e[0m \e[92mFilter results on crimes which occurred during the day.\e[0m\n"

		echo -e "\e[41m\e[1mG\e[0m  \e[93mD\e[0m \e[92mGet the map of crime location.\e[0m\n"
		
		echo -e "\e[41m\e[1mI\e[0m  \e[93mD\e[0m \e[92mExact adress of crime location.\e[0m\n"

		echo -e "\e[92m\e[1mUSAGE EXAMPLE\e[0m For printing the total numbers of crimes that are of primary type Robbery with the description AGGRAVATED that happened during day in 2015 we have the following command:

bash project_ac3.sh -T "CRIMINAL DAMAGE" -D "TO VEHICLE" -E N -c
and the answer should be : Total number:8798 \e[0m\n"
		;;


# -v displays the names of the authors.

	v)
		echo -e "\e[34m==============================================\e[0m\n"
		echo -e "\e[44m\e[1mThis program is developed by - \e[0m \n"
		echo -e "\e[34m==============================================\e[0m\n"
		echo -e "\e[1m\e[93m- Andra Anoaica\e[0m \n"
		echo -e "\e[1m\e[93m- Ajinkya Chandrayan\e[0m \n"
		
		;;

# -f displays the location of the dataset.

	f)
		echo -e "\e[34m==============================================\e[0m\n"
		echo -e "\e[44m\e[1mThe location of dataset - \e[0m \n"
		echo -e "\e[34m==============================================\e[0m\n"	
		
		DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"	
		echo -e "\e[1m\e[93mThe location of dataset is: '$DIR'\e[0m\n"
		
		;;
		
# -l displays the crime details.

	l)

# Displays result in the tabular format.
# The ”\033[0m” sequence marks end of attributes (formatting and colors).

		awk -vFPAT='[^,]*|"[^"]*"' 'BEGIN{printf("%s %25s %18s %45s %55s %55s %55s \n" ,"\033[1m""\033[4mID\033[0m""\033[0m\t", "\033[1m""\033[4mCase Number\033[0m""\033[0m\t", "\033[1m""\033[4mDate Time\033[0m""\033[0m\t", "\033[1m""\033[4mPrimary Type\033[0m""\033[0m\t", "\033[1m""\033[4mDescription\033[0m""\033[0m\t", "\033[1m""\033[4mBlock\033[0m""\033[0m\t", "\033[1m""\033[4mLocation\033[0m""\033[0m\t")} {printf("%8s %15s %35s %30s %55s %55s %55s \n", "\033[43m"$1"\033[0m" , "\033[42m"$2"\033[0m", "\033[44m"$3"\033[0m", "\033[101m"$6"\033[0m", "\033[45m"$7"\033[0m","\033[100m"$4"\033[0m", "\033[46m"$22"\033[0m" )}' $b

		;;

# -c displays the number of crimes.

	c)
		awk 'END {print "Total number:"FNR}' $b
		;;
	
# -r calcuates and displays the crime solving rate.

	r)
		awk -vFPAT='[^,]*|"[^"]*"' '{   n+=1
				if($9 == "true") j+=1 }

				END {
				printf ("\033[93mThe percentage is:\033[0m")
				printf ("\033[44m"((j/n)*100)"\033[0m\n")
				}' $b
		;;
		
# -t displays the different primary types of crimes.		
		
	t)	
		awk -vFPAT='[^,]*|"[^"]*"', '{ a[$6]++ } END { for (b in a) { print "\033[101m"b"\033[0m" } }' $b 
		;;
		
# -d displays different descriptions of the crimes.

	d)	
		awk -vFPAT='[^,]*|"[^"]*"', '{ a[$7]++ } END { for (b in a) { print "\033[43m"b"\033[0m" } }' $b 
		;;

# -m displays different locations of the crimes.

	m)	
		awk -vFPAT='[^,]*|"[^"]*"', '{ a[$8]++ } END { for (b in a) { print "\033[45m"b"\033[0m" } }' $b 
		;;

# -o displays different blocks where the crimes occured.

	o)	
		awk -vFPAT='[^,]*|"[^"]*"', '{ a[$4]++ } END { for (b in a) { print "\033[100m"b"\033[0m" } }' $b 
		;;
	
# -T filters the results on crimes where the primary type is <primarytype>.

	T)

# Input arguments validation and error handling is done to accept the input arguments in correct format with respect to white spaces.

		whitespace="[[:space:]]"
		if [[ "$OPTARG" != $whitespace ]]
		then
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$6 == pattern {print $0}' $b > crimes_T.csv
		else
		echo "Remember, put the primary type inside double quotes."
		fi
	
		if [[ "$OPTARG" =~ $whitespace ]]
		then
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$6 == pattern {print $0}' $b > crimes_T.csv
		else
		echo "Remember, put the primary type inside double quotes."
		fi
		b=crimes_T.csv
		;;
		
# -D filters the results on crimes where the description is <description>.
		
	D)
		
# Input arguments validation and error handling is done to accept the input arguments in correct format with respect to white spaces.

		whitespace="[[:space:]]"
		if [[ "$OPTARG" != $whitespace ]]
		then
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$7 == pattern {print $0}' $b > crimes_D.csv
		else
		echo "Remember, put the description inside double quotes."
		fi

		if [[ "$OPTARG" =~ $whitespace ]]
		then
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$7 == pattern {print $0}' $b > crimes_D.csv
		else
		echo "Remember, put the description inside double quotes."
		fi
		b=crimes_D.csv
		;;
		
# -Y filters the results on crimes that happened during the year <year>
		
	Y)
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$18 == pattern {print $0}' $b > crimes_yyy.csv
		b=crimes_yyy.csv
		;;

# -O filters results on crimes which occured on a specific block
		
	O)

# Input arguments validation and error handling is done to accept the input arguments in correct format with respect to white spaces.

		whitespace="[[:space:]]"
		if [[ "$OPTARG" != $whitespace ]]
		then
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$4 == pattern {print $0}' $b > crimes_y.csv
		else
		echo "Remember, put the block details inside double quotes."
		fi
		
		if [[ "$OPTARG" =~ $whitespace ]]
		then
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$4 == pattern {print $0}' $b > crimes_y.csv
		else
		echo "Remember, put the block details inside double quotes."
		fi
		b=crimes_y.csv
		
		
		;;

# -M filters results on crimes which occured on a specific location
		
	M)

# Input arguments validation and error handling is done to accept the input arguments in correct format with respect to white spaces.

		whitespace="[[:space:]]"
		if [[ "$OPTARG" != $whitespace ]]
		then
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$8 == pattern {print $0}' $b > crimes_yM.csv
		else
		echo "Remember, put the location details inside double quotes."
		fi
		
		if [[ "$OPTARG" =~ $whitespace ]]
		then
		awk -vFPAT='[^,]*|"[^"]*"' -v pattern="$OPTARG" '$8 == pattern {print $0}' $b > crimes_yM.csv
		else
		echo "Remember, put the location details inside double quotes."
		fi
		
		b=crimes_yM.csv
		;;
	
# -A filters the results on crimes on which a person was arrested or not arrested based on the values 'yes' and 'no'.
	
	A)
		
		if [ "$OPTARG" == "yes" ]; 
			then
			awk -vFPAT='[^,]*|"[^"]*"' '$9 ~ /true/ { print }' $b > crimes_arr.csv
			else
			awk -vFPAT='[^,]*|"[^"]*"' '$9 ~ /false/ { print }' $b > crimes_arr.csv 
		fi
		b=crimes_arr.csv
		;;

# -R filters the results on crimes on which a person was arrested or not arrested based on the values 'yes' and 'no'.
	
	R)
		
		if [ "$OPTARG" == "yes" ]; 
			then
			awk -vFPAT='[^,]*|"[^"]*"' '$10 ~ /true/ { print }' $b > crimes_dom.csv
			else
			awk -vFPAT='[^,]*|"[^"]*"' '$10 ~ /false/ { print }' $b > crimes_dom.csv 
		fi
		b=crimes_dom.csv
		;;

# -E filters results on crimes which during the day or night. Parameters N for Night and D for Day!
		
	
	E) 

	if [ "$OPTARG" == "N" ]; 
			then
			awk -vFPAT='[^,]*|"[^"]*"' '{split($0, t);
						      split(t[3],a, " ");
							split(a[2],c, ":")
							  split(c[1],b, "")
						if ((a[3] == "AM" && (c[1]>=6 && c[1]<12))||( a[3] == "PM" && (c[1]==12||c[1]==1||c[1]==2||c[1]==3||c[1]==4||c[1]==5||c[1]==6||c[1]==7||c[1]==8)))  print $0}' $b > crimes_dy.csv
	b=crimes_dy.csv
			elif [ "$OPTARG" == "D" ]; 
			then
			awk -vFPAT='[^,]*|"[^"]*"' '{split($0, t);
				split(t[3],a, " ");
					split(a[2],c, ":")
					split(c[1],b, "")
				if ( (a[3] == "AM" && (b[2]<6&&b[1]==0||(b[1]==1&&b[2]==2)))||( a[3] == "PM" && ((b[2]<2&&b[1]==1)||b[2]==9)))  print $0}' $b > crimes_night.csv
	b=crimes_night.csv
	fi
	;;

	G)

		## Pass 3 arguments  Latitude Longtitude Zoom -to get google maps image
		echo "Enter the parameters:"

		while true; do
 	   	read -p "Enter latitude" lt
		read -p "Enter long" lo
		read -p "Enter zoom" zm
      		break 
		done

		width=400
		height=400
		lat="$lt"
		long="$lo"
		zoom=12
		if [ -n "$3" ]; then
    		zoom="$zm"
		fi
		filename="$lat-$long-$zoom-${width}x$height.png"
		wget "http://maps.google.com/maps/api/staticmap?center=$lat,$long&zoom=$zoom&size=${width}x${height}&sensor=false" -O "$filename"
		# small error checking
		if [ $? -ne 0 ]; then
    		echo "An error occured" >&2
    		exit 1
		fi
		echo "$filename"
;;

I)

		## Pass 2 arguments  Latitude Longtitude -to get adress
		echo "Enter the parameters:"

		while true; do
 	   	read -p "Enter latitude" lt
		read -p "Enter long" lo
		
      		break 
		done

		lat="$lt"
		long="$lo"
		wget -O- -q "http://maps.google.com/maps/api/geocode/xml?latlng=$lat,$long&sensor=false"|\
  		grep formatted|\
 		head -n1|\
 		cut -d\> -f2|\
  		cut -d\< -f1
		
;;

	?)
		exit;;
	esac
done

