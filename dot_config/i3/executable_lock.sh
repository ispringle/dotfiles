#!/usr/bin/env bash

function blur() {
    icon="/home/ian/.config/i3/lock.png"
    tmpbg="/tmp/screen.png"
    
    (( $# )) && { icon=$1; }
    
    scrot "$tmpbg"
    convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
    # convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
    
    #i3lock vanilla configuration
    #i3lock -i "$tmpbg"
    
    #i3lock-color configuration
    i3lock -i "$tmpbg" \
        --inside-color=373445ff --ringcolor=ffffffff --line-uses-inside \
        --keyhl-color=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
        --insidever-color=fecf4dff --insidewrongcolor=d23c3dff \
        --ringver-color=ffffffff --ringwrongcolor=ffffffff \
        --radius=15 --veriftext="" --wrongtext=""
    rm /tmp/screen.png
}

function with_background() {
    i3lock --nofork \
        --ignore-empty-password \
        --line-color=00000000 \
        --keyhl-color=88c0d0ff \
        --bshl-color=d8dee9ff \
        --separator-color=00000000 \
        --radius=70 \
        --ind-pos="1800:960" \
        \
        --insidever-color=00000000 \
        --insidewrong-color=00000000 \
        --inside-color=00000000 \
        \
        --ring-color=5e81acff \
        --ringver-color=a3be8cff \
        --ringwrong-color=bf616aff \
        \
        --clock \
        --time-color=eceff4ff \
        --timeoutline-color=000000FF \
        --time-str="%H:%M" \
        --time-font='Hack Nerd Font' \
        --time-size=75 \
        --time-pos="150:950" \
        \
        --date-color=d8dee9ff \
        --dateoutline-color=000000FF \
        --date-str="%A, %d %B" \
        --date-font="Hack Nerd Font" \
        --date-size=50 \
        --date-pos="340:1015" \
        \
        --verif-text="" \
        --wrong-text="" \
        \
        --indicator \
        \
        --image=/home/ian/.config/i3/lock_screen
}

if $1 == blue; then
    blur;
else
    with_background;
fi
