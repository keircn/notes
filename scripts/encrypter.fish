#!/usr/bin/env fish

set recipient Keiran
set script_dir (dirname (status -f))
set notes_dir "$script_dir/../notes"

for f in $notes_dir/*.md
    if test -f $f
        gpg -e -r $recipient $f
        shred -u $f
    end
end
