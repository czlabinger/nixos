#!/usr/bin/env bash

capsState=$(hyprctl devices -j | jq -r '.keyboards[-1].capsLock')
out=""

if [[ "$capsState" == "true" ]]; then
    out="CapsLock: On"
else
    out="CapsLock: Off"
fi

echo "$out"
exit
