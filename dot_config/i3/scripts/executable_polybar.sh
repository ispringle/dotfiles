#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a \
  /tmp/polybar_top-left.log \
  /tmp/polybar_top-mid.log \
  /tmp/polybar_top-right.log
polybar top-left -r >>/tmp/polybar_top-left.log 2>&1 &
polybar top-mid -r >>/tmp/polybar_top-mid.log 2>&1 &
polybar top-right -r >>/tmp/polybar_top-right.log 2>&1 &

echo "Bars launched..."
