if [[ $1 -eq 1 ]]; then
  pomod start
elif [[ $1 -eq 2 ]]; then
  pomod kill
elif [[ $1 -eq 3 ]]; then
  pomod halt
fi

raw="$(pomod info 2>/dev/null)"
if test $? -eq 0; then
  trem=$(echo "$raw" | cut -d";" -f4)
  pomo_time="$(expr $trem / 60 | xargs printf '%02d'):$(expr $trem % 60 | xargs printf '%02d')"
  #get phase
  case $(echo "$raw" | cut -d";" -f1) in
    0)
      pomo_state="⏳"
      ;;
    1)
      pomo_state="☕"
      ;;
    2)
      pomo_state="🛌"
      ;;
  esac
  pomo_count="$(echo "$raw" | cut -d";" -f3)" #pomodoro count
  echo "x$pomo_count $pomo_time $pomo_state"
else
  echo "Pomod is not running" >&2
  echo
fi


