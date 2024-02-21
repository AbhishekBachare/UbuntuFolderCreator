#!/bin/bash

input_file="raw-data.txt"

# Check file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File $input_file not found."
    exit 1
fi

folder_lines=$(grep -E '^[0-9]+\.' "$input_file")

while read -r line; do
    folder_number=$(echo "$line" | grep -o '^[0-9]\+')
    folder_name=$(echo "$line" | cut -d' ' -f2-)
    folder_name=$(echo "$folder_name" | tr -d '\r')
    folder_name_with_number="${folder_number}.${folder_name}"
    
    mkdir -p "$folder_name_with_number"
    echo "Created folder: $folder_name_with_number"
done <<< "$folder_lines"
