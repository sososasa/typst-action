#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# The first argument is the source file, which is required.
SOURCE_FILE=$1

# The second argument is the optional output file.
OUTPUT_FILE=$2

# Check if a source file was provided
if [ -z "$SOURCE_FILE" ]; then
  echo "Error: No source file provided"
  exit 1
fi

cd /github/workspace

# Check if an output file was provided.
if [ -n "$OUTPUT_FILE" ]; then
  # If an output file is specified, include it in the command.
  typst compile "./$SOURCE_FILE" "$OUTPUT_FILE"
else
  # If no output file is specified, just compile the source.
  # Typst will automatically name the output PDF based on the source file name.
  typst compile "./$SOURCE_FILE"
fi