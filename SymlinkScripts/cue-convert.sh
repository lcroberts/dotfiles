#!/usr/bin/bash

handle_cue() {
	set -eou pipefail
    path=$0
    dir=$(dirname "$path")
    file=$(basename "$path")
    base=$(basename "$file" ".cue")
    cue="./$base.cue"
    flac="./$base.flac"
    cd "$dir"
    if [[ -e "$cue" && -e "$flac" ]]; then
        mv "$flac" "$flac.tmp"
        shnsplit -f "$cue" -t "%n - %t" -o flac "$flac.tmp"
        rm "$cue"
        rm "$flac.tmp"
    else
        echo "Flac file matching '$base.cue' not found in '$path'"
    fi
    cd -
}
export -f handle_cue

find . -type f -name "*.cue" -exec sh -c handle_cue {} \;
