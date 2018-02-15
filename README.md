**GNU/Linux and Shell Scripting Project**

Student: Andra Anoaica, Ajinkya Chandrayan

Program: Master of Science in Big Data

**Project Description**

The current project analyzes a dataset presented in the CSV format, using bash and awk scripting language.

**Database Description**

The current project handles a CSV file containing crimes occurred in the City of Chicago from 2001 to present. Challenges in analyzing this data might come from :

- Size: We have 291246( header included) rows of data and 22 columns which will require some techniques for handling large amount of data in a timely manner.

- Format: The file is CSV, although we also have commas inside the cells, which might require special formatting of the file ( Example record on cell G352 CYCLE, SCOOTER, BIKE W-VIN)

- Missing fields.

**Basic Data  Munging**

As pointed out in the previews section we have a CSV that contains commas inside a field. We can take advantage of the fact that the fields are surrounded by double quotes "". Instead of using a Field Separator , we will proceed in using a Field Pattern. We create a definition of what a record should contain enabling commas that are inside "" to be ignored and not treated as a Field Separator. In our case we will use [^,]*|"[^"]*" as the field begins with one or more characters that are not commas *, or | the field will begin with a double quote followed by characters that are not a double quote and ending with one.

We also decided to delete the header and transfer the dataset into a new document that does not contain the header. We accomplish this action by using the sed function.

sed '1d' crimes.csv > crimes2.csv

Throughout the document specific array of strings from colomn were needed to be retrieved in order to create a filter on weather the crime occurred between specific hours. We used the split function multiple times.

split($0, t)

**Graphical Representation**

The colors and formatted texts can be displayed by using the ANSI/VT100 escape sequences. These sequences are composed of the Escape character (often represented by "^[" or "<Esc>") followed by some other characters.

The -e option of the echo command enable the parsing of these escape sequences.

The "`\e[0m`" sequence removes all attributes (formatting and colors).

The graphics used in this program :-

Example

echo
-e "\e[1mThisIsBoldText`\e[0m"
#prints "ThisIsBoldText"in bold.`

Echo -e "\e[33mYellowText`\e[0m`" #prints "YellowText" in yellow color.

Text Formatting, Colors and Highlights used

**Program Functionalities**

We have split our program functionalities in four categories : *Basic Information* that contains information regarding the script, *Basic Operations* which contains the main operations we can apply on the data set, *Dataset Exploration* which enables the user to see just specific parts of the database in order to apply the filters that are available in the *Filers* area.
**API USAGE**

For the last two filters which retrieve the exact address of the crime scene and the image of the map, we made use of Google Maps APIs. This enable the user to retrieve the desired information by using data that exists in the provided database, more precise the latitude and longitude. The Maps API are available for all sites that are accessible to consumers without charge. In our case we assured that they are used according to Terms of Service.

**Validation & Error Handling**

The input arguments are validated and checked for its desirable format with respect to strings in double quotes and handling white spaces. Appropriate error message is displayed to help user in entering the arguments in correct and desirable format.

For example, to validate the whitespace in the string and to prompt user to enter the string into the double quotes we perform a string check which checks for the white spaces between the argument string and if it is not enclosed within the double quotes -- the user is prompt to enter the argument into double quotes.

**whitespace="[[:space:]]"**

**if [[ "$OPTARG" != $whitespace ]] then ...**

**else**

**echo "Error: Please put the block details inside double quotes."**

**fi**

Also multiple checks have been carried out inside each filter to see if the sum of options equals the total number of crimes.

**Usage Examples**

The User can choose between a wide range of filters. On top of the filters it is possible to list specific unique attributes that belong to the filter or do one of the three basic operations :

- listing the IDs, case numbers, dates, primary types, descriptions, blocks and GPS coordinates of crimes

- counting the total number of crimes according to the filters set

- calculating the crime solving rate according to the filters set

For printing the total numbers of crimes that are of primary type Robbery with the description AGGRAVATED that happened during day in 2015 we have the following command:

bash project_ac3.sh -T "CRIMINAL DAMAGE" -D "TO VEHICLE" -E N -c

and the answer should be : Total number:8798

For using the exact address and map filters, user should provide the latitude and longitude when asked as well as zoom( recommended value is 12) for the image retrieving option. The map images will be saved inside the current folder.

The user should add the database to be used on line 5.
