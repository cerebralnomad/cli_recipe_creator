#! /bin/bash

# This script creates a preformatted blank recipe and opens it in a GUI editor

version="2.0"
date="Feb 11 2019"

# Check to ensure at least one parameter is given (the recipe name)

if [[ ! $1 ]]; then # if $1 doesn't exist
	echo "A name for the recipe is required. i.e. 'My New Recipe'"
        echo "Use -h flag for help."
	exit 0
fi

# If $1 is the --nano flag, set the editor variable
# shift moves the parameter list, $2 becomes $1

if [[ $1 == "--nano" ]]; then 
	editor="nano"
	shift
fi

# Same as above but for the --vim flag

if [[ $1 == "--vim" ]]; then
	editor="vim"
	shift
fi

# Check for either the -h or -v flags for help and version requests

case $1 in

	-h)
		echo "Recipe Version $version"
		echo ""
		echo "This script creates a preformatted blank recipe file and
opens it with a text editor.
It will open first with Kate (if installed), or Pluma (if installed)
or gedit (if installed).
If none of these are available, it defaults to using Nano."
		echo ""
		echo "A recipe name is required to run the script."
		echo "Recipe names that include spaces must be enclosed in quotes"
		echo ""
		echo "Available Flags:"
		echo ""
		echo "--vim  - force the use of Vim as text editor"
		echo "--nano - force the use of nano as text editor"
		echo "-h     - show this help and exit"
		echo ""
		exit 0 ;;

	-v)
	        echo "Recipe Generator v$version"
		exit 0 ;;
esac

# Create the file to be opened. The first line takes the recipe name and 
# makes it all lower case, and replaces spaces with underscores for use as 
# the actual filename.
# $1 is preserved for use as the title in the body of the file

NAME="`echo $1 | tr ' ' '_' | tr '[A-Z]' '[a-z]' | tr '-' '_'`"
    touch ./$NAME.txt
    echo "" >> $NAME.txt
    echo "$1" >> $NAME.txt
    echo "" >> $NAME.txt
    echo "Ingredients" >> $NAME.txt
    echo "" >> $NAME.txt
    echo "" >> $NAME.txt
    echo "" >> $NAME.txt
    echo "Directions" >> ./$NAME.txt
    echo "" >> $NAME.txt
    echo "" >> $NAME.txt

if [[ ! -z $editor ]]; then  # if $editor is not null
	case $editor in
		nano) (nano ./$NAME.txt);;
		vim) (vim ./$NAME.txt);;
		
	esac
	exit 0
fi

# Check which editors are available. Kate on KDE, Pluma on MATE.
# Gedit if neither are available. If no GUI editors found default to Nano
# This will open the file in the first editor found to exist. If Kate and gedit are 
# both installed, Kate will be used

if [[ $(which kate) ]]; then
	(kate ./$NAME.txt &)
elif [[ $(which pluma) ]]; then
	(pluma ./$NAME.txt &)
elif [[ $(which gedit) ]]; then
	(gedit ./$NAME.txt &)
else
	(nano ./$NAME.txt)
fi

