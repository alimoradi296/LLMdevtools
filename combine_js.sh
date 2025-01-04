#!/bin/bash

# Check if directory path is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Directory to scan
SCAN_DIR="$1"

# Output file
OUTPUT_FILE="js_files_content.txt"

# Check if directory exists
if [ ! -d "$SCAN_DIR" ]; then
    echo "Error: Directory '$SCAN_DIR' does not exist"
    exit 1
fi

# Create or clear the output file
> "$OUTPUT_FILE"

# Function to process JavaScript files
process_js_files() {
    local dir="$1"

    # Find all .js files in the directory and subdirectories
    find "$dir" -type f -name "*.js" | while read -r file; do
        # Add a separator line
        echo -e "\n=== File: $file ===\n" >> "$OUTPUT_FILE"

        # Add the file contents
        cat "$file" >> "$OUTPUT_FILE"

        # Add a trailing separator
        echo -e "\n=== End of $file ===\n" >> "$OUTPUT_FILE"

        # Print progress
        echo "Processed: $file"
    done
}

# Main execution
echo "Starting to scan directory: $SCAN_DIR"
echo "Output will be saved to: $OUTPUT_FILE"

# Process files
process_js_files "$SCAN_DIR"

# Check if any files were processed
if [ -s "$OUTPUT_FILE" ]; then
    echo "Scan completed successfully!"
    echo "Results saved in: $OUTPUT_FILE"
else
    echo "No JavaScript files found in the specified directory."
    rm "$OUTPUT_FILE"
