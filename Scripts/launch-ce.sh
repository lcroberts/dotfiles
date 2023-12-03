#!/bin/bash

# A wrapper script to launch cheat engine within a certain steam wine prefix.
# To use it provide the steam appid as the only argument to the program. The
# ce_executable path may need to be changed depending on what version of CE
# you have intsalled. `protonhax init %command%` needs to be present in your
# steam launch options as well.
ce_executable="$HOME/.wine/drive_c/Program Files/Cheat Engine 7.5/cheatengine-x86_64.exe"
protonhax run $1 "$ce_executable"
