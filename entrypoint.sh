#!/bin/bash
set -e

SOURCE_FILE="$1"
echo "Compiling Typst document: $SOURCE_FILE"
echo "Working directory: $(pwd)"
echo "Available files:"
ls -la

compile "$SOURCE_FILE"

echo "✅ Compilation completed!"
echo "Generated files:"
ls -la *.pdf 2>/dev/null || echo "No PDF files found"