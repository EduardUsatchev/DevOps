#!/bin/bash
# archive_demo.sh
# This script demonstrates:
# 1. Creating a sample directory with files.
# 2. Compressing the directory using zip and tar.
# 3. Extracting (unzipping and untarring) the archives.

# --- Step 1: Create a sample directory with files ---
SAMPLE_DIR="sample_data"
mkdir -p "$SAMPLE_DIR"

# Create some sample files
echo "This is file 1" > "$SAMPLE_DIR/file1.txt"
echo "This is file 2" > "$SAMPLE_DIR/file2.txt"
echo "This is file 3" > "$SAMPLE_DIR/file3.txt"

echo "Created sample directory '$SAMPLE_DIR' with sample files."
echo

# --- Step 2: Create a ZIP archive ---
ZIP_ARCHIVE="sample_data.zip"
zip -r "$ZIP_ARCHIVE" "$SAMPLE_DIR"
echo "Created ZIP archive: $ZIP_ARCHIVE"
echo

# --- Step 3: Extract the ZIP archive ---
# Create a directory to extract the zip archive
EXTRACT_ZIP_DIR="extracted_zip"
mkdir -p "$EXTRACT_ZIP_DIR"
unzip "$ZIP_ARCHIVE" -d "$EXTRACT_ZIP_DIR"
echo "Extracted ZIP archive to: $EXTRACT_ZIP_DIR"
echo

# --- Step 4: Create a TAR archive ---
TAR_ARCHIVE="sample_data.tar.gz"
tar -czvf "$TAR_ARCHIVE" "$SAMPLE_DIR"
echo "Created TAR archive: $TAR_ARCHIVE"
echo

# --- Step 5: Extract the TAR archive ---
# Create a directory to extract the tar archive
EXTRACT_TAR_DIR="extracted_tar"
mkdir -p "$EXTRACT_TAR_DIR"
tar -xzvf "$TAR_ARCHIVE" -C "$EXTRACT_TAR_DIR"
echo "Extracted TAR archive to: $EXTRACT_TAR_DIR"
echo

# --- Cleanup (optional) ---
# Uncomment the following lines to remove created archives and directories after testing.
# rm -rf "$SAMPLE_DIR" "$EXTRACT_ZIP_DIR" "$EXTRACT_TAR_DIR" "$ZIP_ARCHIVE" "$TAR_ARCHIVE"
# echo "Cleaned up all sample files and archives."
