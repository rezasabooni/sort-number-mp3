# Rename and Sort MP3 Files

## Overview

This Bash script is designed to efficiently organize and rename MP3 files in a folder. It performs the following tasks:

1. Updates the file permissions for all MP3 files in the folder to `664`.
2. Cleans up file names by removing leading numbers, special characters, and unnecessary prefixes.
3. Sorts the files alphabetically.
4. Adds sequential numbers (with dynamic zero-padding) to the beginning of each file name.

## Features

- Automatically handles files with complex names.
- Dynamic zero-padding based on the total number of MP3 files (supports up to thousands of files).
- Ensures no accidental overwriting of files during renaming.
- Prints detailed messages for all operations, including warnings for invalid file names.

---

## Usage

1. **Copy the Script:**
   - Save the script as `sortmp3.sh` in the directory where your MP3 files are located.

2. **Make the Script Executable:**
   ```bash
   chmod +x sortmp3.sh
   ```

3. **Run the Script:**
   ```bash
   ./sortmp3.sh
   ```

4. **Script Output:**
   - The script will print messages for each operation:
     - Files with updated permissions.
     - Files that are renamed with sequential numbers.
     - Warnings for invalid file names that cannot be processed.

---

## Example

### Before Running the Script:
Folder contains:
```text
001_song.mp3
song-02.mp3
random_music_3.mp3
special#char_song.mp3
```

### After Running the Script:
Folder contains:
```text
00_song.mp3
01_song-02.mp3
02_random_music_3.mp3
03_special#char_song.mp3
```

---

## Notes

- **Dynamic Padding:** If there are fewer than 100 files, the script uses two-digit numbers (`00`, `01`, etc.). For 100–999 files, three-digit numbers (`000`, `001`, etc.) are used, and for 1,000+ files, four-digit numbers (`0000`, `0001`, etc.) are used.
- **Permission Update:** All MP3 files will have their permissions set to `664` for consistency.

---

## Requirements

- **Bash Shell:** Ensure your system has Bash installed (default in most Linux distributions).
- **File Format:** The script processes only `.mp3` files.

---

## License

This script is licensed under the **MIT License**. Feel free to use, modify, and distribute it.

---

## Contact

If you encounter issues or have suggestions, feel free to contact the maintainer:

**Maintainer:** Reza Sabooni  
<!--**Email:** reza.sabooni@gmail.com-->
