#!/bin/bash

# Check if required arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <search_string> <replacement_string> <search_directory>"
    echo "Example: $0 '\.website\.' '.newsite.' '/path/to/search'"
    exit 1
fi

SEARCH_STRING="$1"
REPLACEMENT_STRING="$2"
SEARCH_DIR="$3"

# Check if search directory exists
if [ ! -d "$SEARCH_DIR" ]; then
    echo "Error: Directory '$SEARCH_DIR' does not exist."
    exit 1
fi

# Initialize counters
total_files=0
total_replacements=0

# Function to print separator line
print_separator() {
    echo "================================================================="
}

# Print header
echo "Search and Replace Operation"
echo "Search for: '$SEARCH_STRING'"
echo "Replace with: '$REPLACEMENT_STRING'"
echo "Search Directory: $SEARCH_DIR"
echo "Started on: $(date)"
print_separator

# Search through files recursively
while IFS= read -r -d '' file; do
    # Skip binary files and hidden directories
    if [[ -b "$file" ]] || [[ -c "$file" ]] || [[ "$file" == *"/.git/"* ]]; then
        continue
    fi

    # Count occurrences in this file (case-insensitive)
    count=$(grep -i "$SEARCH_STRING" "$file" 2>/dev/null | wc -l)
    
    if [ $count -gt 0 ]; then
        # Perform replacement
        sed -i "s/$SEARCH_STRING/$REPLACEMENT_STRING/g" "$file" 2>/dev/null
        
        total_files=$((total_files + 1))
        total_replacements=$((total_replacements + count))
        
        echo "Modified: $file"
        echo "  Replacements in this file: $count"
        print_separator
    fi
done < <(find "$SEARCH_DIR" -type f -print0)

# Print summary
echo "Operation Summary:"
echo "Total files modified: $total_files"
echo "Total replacements made: $total_replacements"
print_separator

# Print warning if no files were modified
if [ $total_files -eq 0 ]; then
    echo "Warning: No files were found containing the search string."
fi
