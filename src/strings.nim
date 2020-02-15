# strings doc & examples

# Simply declare let/var, variable with '=' operator and the string between double quotes
let si = "This is an immutable string"
var sm = "This is a mutable string"

echo si   # -->  This is an immutable string
echo sm   # -->  This is a mutable string


# You **CANNOT** re-assign an **IMMUTABLE** strings.  
# This will cause a compiling **ERROR**:
## si = "Trying to re-assign th immutable string"

## COMPILING ERROR
## Error: 'si' cannot be assigned to


# You **CAN** re-assign a **MUTABLE** strings.  
sm = "Re-assigning the mutable string"

echo sm   # -->  Re-assigning the mutable string


# explicit string declaration
let siexp:string = "Another immutable string"
let smexp:string = "Another mutable string"

echo siexp   # --> Another immutable string
echo smexp   # --> Another mutable string

# multi-line string declaration
let mls = """ This is 
a multi-line string,
you can use it for html code
or just for christmas tree! ;-)
 
    *   
   ***
  *****
 *******
*********
    |
"""
echo mls   # --> Another immutable string


# string with unicode characters ₪ ⎒ ♥ ♫ ☻
let struni = "This is a string with unicode characters: ℛ ₪ ⎒ ♥ ♫ ☻"

echo struni   #---> This is a string with unicode characters: ℛ ₪ ⎒ ♥ ♫ ☻


echo "This is the first line...\n...and this is the second one"
# ---> This is the first line...
#      ...and this is the second one


# string with '\t' (tab character):
echo "This is the first part of the string\tand this is the second one"
# ---> This is the first part of the string    and this is the second one


# string with '\\' (backslash character):
echo "This is the path-string: c:\\folder\\inner-folder\\"
# ---> This is the path-string: c:\folder\inner-folder\

# string with \" (quotation mark):
echo "This is a string with \"double quote\" in the text"
# ---> This is a string with "double quote" in the text

# bypass escape characters with a raw string:
echo r"This is a raw string: escape characters like '\n' '\t' '\\' are not interpreted"
echo r"In a raw string you can write 'c:\program files\nim\' instead of 'c:\\program files\\nim\\'"

let s1 = "This"
let s2 = "string"
echo s1 & " is" & " a" & " concatenated " & s2
# -->  This is a concatenated string

# Appending string with 'add' method
var stradd = "This is a string concatenated"
stradd.add("...with .add() method")
echo stradd
# ---> This is a string concatenated...with .add() method

# string.len() / string.len: return the lenght of the string
var l = "The lenght of this string is"
echo l, ": ", l.len()
echo "this is 11!".len

# Comparison by lenght, using operators '<', '>', '<=', '>=', '==', '!=':
# A boolean value will be returned
let
  s1 = "This string has some characters"
  s2 = "This one has few chars"
  s3 = "This string in longer than others, because it has a lot of characters"
echo s1 > s2   # --> true
echo s3 <= s1   # --> false
echo s2 == s3   # --> false
echo s1 != s3   # --> true

# $string --> str: transform a value in a string
let numint = 123   # integer
let numflo = 0.987   # float
let s = $numint & "-four-five-six-" & $numflo   # string concatenation
echo s   # ---> 123-four-five-six-0.987




# string.replace("str", "str_new") --> str : return the modified string
import strutils
var s = "This string has concatenated words"
echo s.replace("concatenated", "replaced")
# --> This string has replaced words

# string.split('str_sep') --> @[]str : return an array of strings, splitted by the separator (argument)
echo s.split(" ")
# ---> @["This", "string", "has", "concatenated", "words"]