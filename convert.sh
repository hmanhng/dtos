#!/bin/sh

# Get output file as argument or fall back to `dtos`.
of="$1"
[ -z "$1" ] && of='dtos'

# Extract the shebang from README.org and write it to new file.
grep ':shebang' README.org | cut -d \" -f2 > "$of"

# Extract all '#+begin/end_src' blocks from README.org and append them to file;
# Remove the last line of whitespace since emacs does that too.
awk '/^#\+begin_src/{flag=1;next}/^#\+end_src/{flag=0;print ""}flag' \
    README.org | head -n -1 >> "$of"

# Make the new file executable
chmod +x "$of" 

