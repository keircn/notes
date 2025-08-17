#!/usr/bin/env fish

set script_dir (dirname (status -f))
set notes_dir "$script_dir/../notes"

for f in $notes_dir/*.gpg
    if test -f $f
        set out (string replace -r '\.gpg$' '' $f)
        gpg -d $f >$out
        shred -u $f
    end
end
