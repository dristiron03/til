#!/bin/bash

# Script to create a new TIL writeup from template

set -e

TEMPLATE_FILE="TEMPLATE.md"
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to slugify a string (convert to lowercase, replace spaces with hyphens)
slugify() {
    echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g'
}

# Function to get current date in YYYY-MM-DD format
get_current_date() {
    date +%Y-%m-%d
}

# Check if template exists
if [ ! -f "$BASE_DIR/$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found at $BASE_DIR/$TEMPLATE_FILE"
    exit 1
fi

# Prompt for title
read -p "Enter title: " title
if [ -z "$title" ]; then
    echo "Error: Title cannot be empty"
    exit 1
fi

# Prompt for category
read -p "Enter category (default: temporal): " category
category=${category:-temporal}

# Prompt for custom filename (optional)
read -p "Enter filename (leave empty to auto-generate from title): " custom_filename

# Prompt for date (default to today)
read -p "Enter date (YYYY-MM-DD, default: $(get_current_date)): " date_input
date=${date_input:-$(get_current_date)}

# Validate date format
if ! [[ "$date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Error: Invalid date format. Please use YYYY-MM-DD"
    exit 1
fi

# Create category directory if it doesn't exist
category_dir="$BASE_DIR/$category"
mkdir -p "$category_dir"

# Generate filename from title or use custom filename
if [ -z "$custom_filename" ]; then
    filename=$(slugify "$title")
else
    filename="${custom_filename%.md}"  # Remove .md extension if provided
fi
filepath="$category_dir/$filename.md"

# Check if file already exists
if [ -f "$filepath" ]; then
    read -p "File $filepath already exists. Overwrite? (y/N): " overwrite
    if [[ ! "$overwrite" =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
fi

# Read template and replace placeholders
sed -e "s/\[Title\]/$title/g" \
    -e "s/YYYY-MM-DD/$date/g" \
    -e "s/\[category-name\]/$category/g" \
    "$BASE_DIR/$TEMPLATE_FILE" > "$filepath"

echo "✓ Created new writeup: $filepath"
echo "  Title: $title"
echo "  Category: $category"
echo "  Date: $date"

