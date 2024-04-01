#!/bin/bash

# Initialize variables
input_dir=""
output_dir=""

# Function to show usage
usage() {
    echo "Usage: $0 -d input_directory [-o output_directory]"
    echo "  -d  Specify the directory where the .gz files are located."
    echo "  -o  Specify the output directory for decompressed files (defaults to the same as -d if not specified)."
    exit 1
}

# Check if no parameters were provided
if [ $# -eq 0 ]; then
    usage
fi

# Parse command-line options
while getopts "d:o:" opt; do
    case "${opt}" in
        d)
            input_dir=${OPTARG}
            ;;
        o)
            output_dir=${OPTARG}
            ;;
        \?)
            usage
            ;;
    esac
done

# Check if the input directory was provided
if [ -z "${input_dir}" ]; then
    echo "Error: Input directory is required."
    usage
fi

# If output directory wasn't provided, use input directory as output directory
if [ -z "${output_dir}" ]; then
    output_dir="${input_dir}"
fi

# Validate input directory
if [ ! -d "${input_dir}" ]; then
    echo "Error: Input directory does not exist."
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "${output_dir}"

# Decompress .gz files
# Collect all .gz files into an array
mapfile -t gz_files < <(find "${input_dir}" -name '*.gz')

# Get total number of files
total_files=${#gz_files[@]}
current_file=0

# Loop through each file and decompress
for gz_file in "${gz_files[@]}"; do
    ((current_file++))
    file_size_bytes=$(stat -c %s "$gz_file")  # Get file size in bytes
    # Calculate file size in MB and KB
    file_size_mb=$(echo "scale=2; $file_size_bytes / 1024 / 1024" | bc)
    file_size_kb=$(echo "scale=2; $file_size_bytes / 1024" | bc)
    
    # Determine how to print the file size based on its size
    if (( $(echo "$file_size_mb >= 1" | bc -l) )); then
        size_str="${file_size_mb} MB"
    else
        size_str="${file_size_kb} KB"
    fi

    output_file="${output_dir}/$(basename "${gz_file}" .gz)"
    gunzip -c "${gz_file}" > "${output_file}"
    echo "Decompressing ${gz_file} (${current_file}/${total_files}), size: ${size_str}..."
done
echo
echo "Decompression complete. Files are located in ${output_dir}"


