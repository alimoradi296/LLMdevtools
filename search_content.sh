#!/bin/bash

# Check if required arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <search_string> <search_directory> <output_file>"
    echo "Example: $0 'TODO' '/path/to/search' 'results.txt'"
    exit 1
fi

SEARCH_STRING="$1"
SEARCH_DIR="$2"
OUTPUT_FILE="$3"

# Check if search directory exists
if [ ! -d "$SEARCH_DIR" ]; then
    echo "Error: Directory '$SEARCH_DIR' does not exist."
    exit 1
fi

# Clear output file if it exists
> "$OUTPUT_FILE"

# Function to print separator line
print_separator() {
    echo "=================================================================" >> "$OUTPUT_FILE"
}

# Print header
echo "Search Results for: '$SEARCH_STRING'" >> "$OUTPUT_FILE"
echo "Search Directory: $SEARCH_DIR" >> "$OUTPUT_FILE"
echo "Generated on: $(date)" >> "$OUTPUT_FILE"
print_separator

# Counter for matches
total_files=0
total_matches=0

# Search through files recursively
while IFS= read -r -d '' file; do
    # Skip binary files and hidden directories
    if [[ -b "$file" ]] || [[ -c "$file" ]] || [[ "$file" == *"/.git/"* ]]; then
        continue
    fi

    # Search for matches in the current file
    matches=$(grep -n "$SEARCH_STRING" "$file" 2>/dev/null)
    
    if [ ! -z "$matches" ]; then
        # Count matches in this file
        match_count=$(echo "$matches" | wc -l)
        total_matches=$((total_matches + match_count))
        total_files=$((total_files + 1))
        
        # Print file header
        echo "File: $file" >> "$OUTPUT_FILE"
        echo "Number of matches: $match_count" >> "$OUTPUT_FILE"
        echo "Matches:" >> "$OUTPUT_FILE"
        
        # Print each matching line with line number
        while IFS= read -r line; do
            line_num=$(echo "$line" | cut -d: -f1)
            content=$(echo "$line" | cut -d: -f2-)
            echo "  Line $line_num: $content" >> "$OUTPUT_FILE"
        done <<< "$matches"
        
        print_separator
    fi
done < <(find "$SEARCH_DIR" -type f -print0)

# Print summary
echo "Search Summary:" >> "$OUTPUT_FILE"
echo "Total files with matches: $total_files" >> "$OUTPUT_FILE"
echo "Total matches found: $total_matches" >> "$OUTPUT_FILE"

echo "Search completed. Results saved to: $OUTPUT_FILE"
