#!/bin/bash

# Step 1: Set permissions of all MP3 files to 664
find . -maxdepth 1 -type f -name "*.mp3" | while read -r file; do
    chmod 664 "$file"
done
echo "All MP3 files have been set to permissions 664."

# Step 2: Remove all leading numbers and special characters, then sort files
find . -maxdepth 1 -type f -name "*.mp3" | while read -r file; do
    # Remove the "./" prefix from the filename if it exists
    file="${file#./}"

    # Check if it's a valid file
    if [[ -f "$file" ]]; then
        # Clean the filename by removing all leading numbers, underscores, or special characters until a word starts
        cleaned_filename=$(echo "$file" | sed 's/^[^a-zA-Z]*//')

        # Check if the cleaned filename contains only numbers or is empty
        if [[ "$cleaned_filename" =~ ^[0-9]*\.mp3$ || -z "$cleaned_filename" ]]; then
            # Print the reason why the file will not be renamed
            echo "File '$file' contains only numbers or has no valid name after cleanup, and will not be renamed."
        else
            # Rename the file to the cleaned version before sorting
            mv "$file" "$cleaned_filename"
        fi
    fi
done

# Step 3: Calculate padding based on the number of files
file_count=$(find . -maxdepth 1 -type f -name "*.mp3" | wc -l)
if ((file_count < 100)); then
    padding=2
elif ((file_count < 1000)); then
    padding=3
else
    padding=4
fi

# Step 4: Sort files and add increments with dynamic padding
counter=0
find . -maxdepth 1 -type f -name "*.mp3" | sort | while read -r file; do
    # Remove the "./" prefix from the filename if it exists
    file="${file#./}"

    # Generate the new filename with dynamic padding
    new_filename=$(printf "%0${padding}d_%s" "$counter" "$file")

    # Rename the file
    mv "$file" "$new_filename"

    # Increment the counter
    ((counter++))

    # Print a success message for the renamed file
    echo "Renamed '$file' to '$new_filename'."
done

# Print a final completion message
echo "Renaming, sorting, and permission updates completed!"
