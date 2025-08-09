#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# The first argument is the source file, which is required.
# The second argument is the optional output file.
SOURCE_FILE=$1
OUTPUT_FILE=$2

# Check if a source file was provided
if [ -z "$SOURCE_FILE" ]; then
  echo "Error: No source file provided"
  exit 1
fi

# Change to github workspace
cd /github/workspace

# Verify the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
  echo "Error: Source file $SOURCE_FILE does not exist"
  exit 1
fi

# Check if an output file was provided.
if [ -n "$OUTPUT_FILE" ]; then
  # If an output file is specified, include it in the command.
  echo "Compiling $SOURCE_FILE to $OUTPUT_FILE"
  typst compile "$SOURCE_FILE" "$OUTPUT_FILE"
else
  # If no output file is specified, just compile the source.
  # Typst will automatically name the output PDF based on the source file name.
  echo "Compiling $SOURCE_FILE"
  typst compile "$SOURCE_FILE"
fi

# Ensure we only have the expected output
echo "Compilation complete."
ls -la *.pdf 2>/dev/null || echo "No PDFs found in root directory"