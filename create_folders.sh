#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <destination_folder>"
    exit 1
fi

input_file="$1"
destination_folder="$2"

# Check command-line argument for file
if [ ! -f "$input_file" ]; then
    echo "Error: File $input_file not found."
    exit 1
fi

# Check if the destination folder exists or create it
if [ ! -d "$destination_folder" ]; then
    mkdir -p "$destination_folder"
fi

# reg ex search
folder_lines=$(grep -E '^[0-9]+\.' "$input_file")

while read -r line; do
    folder_number=$(echo "$line" | grep -o '^[0-9]\+')
    folder_name=$(echo "$line" | cut -d' ' -f2-)
    folder_name=$(echo "$folder_name" | tr -d '\r')
    folder_name_with_number="${folder_number}.${folder_name}"
    
    mkdir -p "$destination_folder/$folder_name_with_number"
    echo "Created folder: $destination_folder/$folder_name_with_number"
done <<< "$folder_lines"
