#!/bin/bash
set -e

SOURCE_FILE="$1"
echo "Compiling Typst document: $SOURCE_FILE"

# Change to the directory containing the file
cd "$(dirname "$SOURCE_FILE")"
FILE_NAME="$(basename "$SOURCE_FILE")"

echo "Working directory: $(pwd)"
echo "Compiling: $FILE_NAME"

typst compile "$FILE_NAME"

echo "✅ Compilation completed!"
echo "Generated files:"
ls -la *.pdf 2>/dev/null || echo "No PDF files found"