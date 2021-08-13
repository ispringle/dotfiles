dmenu -sb "#d79921" -sf "#1d2021" -nf "#000000" -nb "#000000" -p "Set timer for how long?" <&- | \
	/home/ian/.config/i3/timer.py "$1"
