#!/bin/bash

LAYER=$(yabai -m query --windows --window | jq -r '.[0].layer')

if [ $LAYER == "normal" ]; then
    yabai -m window --toggle sticky --toggle pip --layer normal
else
    yabai -m window --toggle sticky --toggle pip --layer above
fi

