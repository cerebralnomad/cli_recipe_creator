# recipe_creator
Shell script to create recipe template and open in text editor

This script takes the name of the recipe "My New Recipe" and creates a preformatted blank
recipe file in the current working directory and opens it in an editor.

The format of the file is:

===============================

Recipe Title

Ingredients

Directions

================================

The recipe title is converted to lower case and the spaces to underscores for use as the file name.

The file will be opened first in Kate (if present) 
If not, then Pluma (if present)
If not then gedit (if present)

If none of the gui editors are found it defaults to nano.

You can force the use of nano or vim with the --nano and --vim flags

Usage:
recipe.sh 'My new recipe' - creates the file and opens in one of the editors above

recipe.sh --vim 'My new recipe' - creates the file and opens with vim

recipe.sh --nano 'My new recipe' - creates the file and opens with nano

recipe.sh -h - shows the help text and exits
