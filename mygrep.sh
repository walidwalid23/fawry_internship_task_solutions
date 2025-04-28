#!/bin/bash

# --help function

help_function(){
  echo "Usage: $0 [-n] [-v] <pattern> <file>"
  echo "Options:"
  echo "  -n  Show line numbers for each match"
  echo "  -v  Invert the match (print lines that do not match)"
  echo "  --help  Show help message"
  echo "Example:"
  echo " $0 -nv hello testfile.txt" 

}

# adding support for --help flag

if [[ "$1" == "--help" ]]
then
    help_function
    exit 0
fi

# defining options variables

n_show_line_numbers=false
v_invert_match=false

while getopts "nv" opt
do
    case "$opt" in
	    n) n_show_line_numbers=true ;;
	    v) v_invert_match=true ;;
	    *) echo "Wrong option"; exit 1 ;;
    esac
done

# shift the parsed options
shift $((OPTIND-1))

# handle too few arguments
if [[ $# -lt 2 ]]
then
     echo "invalid input: too few arguments"
     exit 1
fi

# arguments variables
pattern_string=$1
text_file=$2

# handle missing file
if [[ ! -f "$text_file" ]]
then
     echo "invalid input: missing file"
     exit 1
fi

# search for the string in the text file

line_number=0

while IFS= read -r line; do
  ((line_number++))

  matched=false

  # check if the pattern string exists in the line with case insensitive
  if [[ "${line,,}" == *"${pattern_string,,}"* ]]
  then
    matched=true
  fi

  # Invert match if -v is provided
  if $v_invert_match
  then
    if $matched
    then
	 matched=false
    else
	 matched=true
    fi
  fi

  # Output 
  if $matched
  then
    if $n_show_line_numbers
    then
      echo "$line_number:$line"
    else
      echo "$line"
    fi
  fi
done < "$text_file"
