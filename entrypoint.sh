#!/bin/bash

set -e

SOURCE_FILE="$1"
OUTPUT_FILE="$2"

echo "Compiling Typst document: $SOURCE_FILE"

if [ -n "$OUTPUT_FILE" ]; then
    echo "Output file specified: $OUTPUT_FILE"
    typst compile "$SOURCE_FILE" "$OUTPUT_FILE"
else
    echo "Using default output filename"
    typst compile "$SOURCE_FILE"
fi

echo "✅ Compilation completed successfully!"

# List generated PDF files for debugging
echo "Generated files:"
ls -la *.pdf 2>/dev/null || echo "No PDF files found"