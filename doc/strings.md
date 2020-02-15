# [Nim Programming Language](https:#vlang.io/docs)  !! WIP !!
##### [doc](..\nimdoc.md)/[strings](strings.md)

## STRINGS

"Strings" is a builtin data type in Nim, so you can use it always (module declarations is not necessary).

---
#### Declaration:
You can declare **MUTABLE** or **IMMUTABLE** strings.  
Use **let** for *immutable* string declaration.  
Use **var** for *mutable* string declaration.  

**Simpler declaration**:  
you can declare string variables taking advantange of the **compiler type inference**: it's not necessary to declare the "string" type, because the type will be resolved by the compiler.
```nim
# Simply declare let/var, variable with '=' operator and the string between double quotes 
let si = "This is an immutable string"
var sm = "This is a mutable string"

echo si   # -->  This is an immutable string
echo sm   # -->  This is a mutable string
```

You **CANNOT** re-assign an **IMMUTABLE** strings.  
This will cause a compiling **ERROR**:
```nim
si = "Trying to re-assign an immutable string"

# COMPILING ERROR
# Error: 'si' cannot be assigned to
```

You **CAN** re-assign a **MUTABLE** strings.  
```nim
sm = "Re-assigning the mutable string"

echo sm   # -->  Re-assigning the mutable string
```

**Explicit Declaration**:  
you can choose to declare the string variables, without the use of the *compiler type inference*. Simply you have to declare the "string" type after the variable name and the ":" operator.
```nim
# explicit string declaration
let siexp:string = "Another immutable string"
let smexp:string = "Another mutable string"

echo siexp   # --> Another immutable string
echo smexp   # --> Another mutable string
```

**Multi-line strings**:  
for declaring a multi-line string just write the string text between a triple "double-quote"
```nim
# multi-line string declaration
let mls = """This is 
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

echo mls
# -->  This is
#      a multi-line string,
#      you can use it for html code
#      or just for christmas tree! ;-)
#
#          *
#         ***
#        *****
#       *******
#      *********
#          |
```

**Unicode glyphs**:  
In Nim the strings contain text, encoded with the **UTF-8** format, but also **Unicode** format is allowed. So you can use some 'Rune' type (glyphs) in your text.
```nim
# string with unicode characters ₪ ⎒ ♥ ♫ ☻
echo "This is a string with unicode characters: ℛ ₪ ⎒ ♥ ♫ ☻"
#---> This is a string with unicode characters: ℛ ₪ ⎒ ♥ ♫ ☻
```

**Raw strings and escape characters**:  
There are some "special" characters, which have a particular meaning, especially in text formatting.
They're called "escape characters" and they're always preceded by the '```\```' character. To "bypass" the string interpretation, you can use the **raw string** format, just putting '```r```' after the opening string double-quote.
```nim
# string with \n (newline character):
echo "This is the first line...\n...and this is the second one"
# ---> This is the first line...
#      ...and this is the second one

# string with \t (tab character):
echo "This is the first part of the string\tand this is the second one"
# ---> This is the first part of the string    and this is the second one

# string with \\ (backslash character):
echo "This is the path-string: c:\\folder\\inner-folder\\"
# ---> This is the path-string: c:\folder\inner-folder\

# string with \" (quotation mark):
echo "This is a string with \"double quote\" in the text"
# ---> This is a string with "double quote" in the text

# bypass escape characters with a raw string:
echo r"This is a raw string: escape characters like '\n' '\t' '\\' are not interpreted"
echo r"In a raw string you can write 'c:\program files\nim\' instead of 'c:\\program files\\nim\\'"

# ---> This is a raw string: escape characters like '\n' '\t' '\\' are not interpreted
# ---> In a raw string you can write 'c:\program files\nim\' instead of 'c:\\program files\\nim\\'
```

---
#### Concatenation:
You can join only strings with strings.

```nim
# Concatenation with '&' operator
let s1 = "This"
let s2 = "string"
echo s1 & " is" & " a" & " concatenated " & s2
# -->  This is a concatenated string

# Appending string with 'add' method
var stradd = "This is a string concatenated"
stradd.add("...with .add() method")
echo stradd
# ---> This is a string concatenated...with .add() method
```

---
#### Lenght:
```nim
# string.len() / string.len: return the lenght of the string
var l = "The lenght of this string is"
echo l, ": ", l.len()
echo "this is 11!".len
# ---> The leght of this string is: 28
# ---> 11
```

---
#### Comparison:
```nim
# Comparison by lenght, using operators '<', '>', '<=', '>=', '==', '!=':
# A true/false value will be returned
let
  s1 = "This string has some characters"
  s2 = "This one has few chars"
  s3 = "This string in longer than others, because it has a lot of characters"
echo s1 > s2   # --> true
echo s3 <= s1   # --> false
echo s2 == s3   # --> false
echo s1 != s3   # --> true
```

---
#### Casting:

```nim
# $<var_name> --> str: transform a value in a string
let numint = 123     # integer
let numflo = 0.987   # float
let s = $numint & "-four-five-six-" & $numflo   # string concatenation
echo s   # ---> 123-four-five-six-0.987
```

---
#### String Manipulation Methods:
You can modify strings with some methods of the ```strutils``` module, a package of the standard library. You can find all the methods in the official documention [here](https://nim-lang.org/docs/strutils.html#replace%2Cstring%2Cstring%2Cstring).  
First of all, you have to import the ```strutils``` module:
```nim
import strutils
```

```nim
# string.replace("str", "str_new") --> str : return the modified string
import strutils
var s = "This string has concatenated words"
echo s.replace("concatenated", "replaced")
# --> This string has replaced words

# string.split('str_sep') --> @[]str : return an array of strings, splitted by the separator (argument)
echo s.split(" ")
# ---> @["This", "string", "has", "concatenated", "words"]

# string.left(int_n) --> str : return the first 'int_n' characters of the string


# string.right(int_n) --> str : return the last characters, starting from 'int_n' c


# string.reverse() --> string : return the reversed string


# string.contains('str_sub') --> boolean : return 1 if the string contains the sub-string 

# string.starts_with('str_sub') --> boolean : return 1 if the string starts with the s


# string.ends_with('str_sub') --> boolean : return 1 if the string ends with the s


# string.to_lower() --> str : return a string with all uppercase characters converted 


# string.to_upper() --> str : return a string with all lowercase characters converted 


# string.substr(int_start, int_end) --> str : return a sub-string from 'int_start' to 

# string.find_between('str_start', 'str_end') --> str : return a sub-string from '
```
---


##### (Unofficial Docs & Tutorials by [Fabreath](https:#gitlab.com/fabreath))