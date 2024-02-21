# UBUNTU - script for folder creation
Script for creating lesson folder from raw data.
Create lessons folders like "1. topic one", "2. topic two" ... and so on

**Raw data sample** 
1. topic one
2. topic two
3. topic three ... so on.

**v1.0**  
execution:  
create_folders.sh  

**v1.1**  
Added feature to pass raw data file as argument.  
execution:  
create_folders.sh <path_to_raw_data_file.txt>  

**v1.2**  
Added feature to pass data file & destination folder path as arguments.  
execution:  
create_folders.sh <raw_file_path.txt> <path_to_destination_folder>  
e.g.:  
./create_folders.sh raw-data.txt /home/dev/lessons/
