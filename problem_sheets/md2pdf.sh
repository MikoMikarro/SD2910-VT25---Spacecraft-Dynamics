#!/bin/bash

# md2pdf.sh - Convert Markdown files to beautiful PDFs with LaTeX support
# Usage: ./md2pdf.sh input.md [output.pdf]

# Display help if requested
if [[ "$1" == "-h" || "$1" == "--help" || "$1" == "" ]]; then
  echo "Usage: ./md2pdf.sh input.md [output.pdf]"
  echo ""
  echo "Converts a Markdown file to a beautiful PDF with LaTeX equation support."
  echo ""
  echo "Arguments:"
  echo "  input.md    Input Markdown file (required)"
  echo "  output.pdf  Output PDF file (optional, defaults to input filename with .pdf extension)"
  echo ""
  echo "Options:"
  echo "  -h, --help  Show this help message"
  exit 0
fi

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
  echo "Error: Pandoc is not installed. Please install it first."
  echo "Visit: https://pandoc.org/installing.html"
  exit 1
fi

# Check if input file exists
if [ ! -f "$1" ]; then
  echo "Error: Input file '$1' not found."
  exit 1
fi

# Set input and output filenames
INPUT_FILE="$1"
OUTPUT_FILE="${2:-${INPUT_FILE%.md}.pdf}"

echo "Converting '$INPUT_FILE' to '$OUTPUT_FILE'..."

# Create a temporary LaTeX header file for code styling
# Run pandoc with all the nice formatting options
pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" \
  --pdf-engine=xelatex \
  --highlight-style=tango \
  --variable geometry:margin=1in \
  --variable fontfamily=libertinus \
  --variable colorlinks=true \
  --variable linkcolor=blue \
  --variable urlcolor=blue \
  --variable monofont="DejaVu Sans Mono" \

# Check if conversion was successful
if [ $? -eq 0 ]; then
  echo "Conversion successful! PDF saved as '$OUTPUT_FILE'"
  exit 0
else
  echo "Error: Conversion failed."
  exit 1
fi
