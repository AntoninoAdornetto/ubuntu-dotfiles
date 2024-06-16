#!/bin/env bash

scripts="$HOME/.config/hypr/scripts"
notify_cmd="notify-send -h string:x-canonical-private-synchronous:shot-notify -u low"

timestamp=$(date "+%d-%b_%H-%M-%S")
outdir="$(xdg-user-dir)/Pictures/Screenshots"
filename="Screenshot_${time}_${RANDOM}.png"

active_window_class=$(hyprctl -j activewindow | jq -r '(.class)')
active_window_file="Screenshot_${timestamp}_${active_window_class}.png"
active_window_path="${outdir}/${active_window_file}"

# notify and view screenshot
notify_view() {
  if [[ "$1" == "active" ]]; then
    if [[ -e "${active_window_path}" ]]; then
      ${notify_cmd} "Screenshot of '${active_window_class}' Saved."
    else
      ${notify_cmd} "Screenshot of '${active_window_class}' not Saved"
    fi
  elif [[ "$1" == "swappy" ]]; then
    ${notify_cmd} "Screenshot Captured."
  else
    local check_file="$outdir/$filename"
    if [[ -e "$check_file" ]]; then
      ${notify_cmd} "Screenshot Saved."
    else
      ${notify_cmd} "Screenshot NOT Saved."
    fi
  fi
}



# countdown
countdown() {
  for sec in $(seq $1 -1 1); do
    notify-send -h string:x-canonical-private-synchronous:shot-notify -t 1000 -i "Taking shot in : $sec"
    sleep 1
  done
}

# take shots
shotnow() {
  cd ${outdir} && grim - | tee "$filename" | wl-copy
  sleep 2
  notify_view
}

shot5() {
  countdown '5'
  sleep 1 && cd ${outdir} && grim - | tee "$filename" | wl-copy
  sleep 1
  notify_view

}

shot10() {
  countdown '10'
  sleep 1 && cd ${outdir} && grim - | tee "$filename" | wl-copy
  notify_view
}

shotwin() {
  w_pos=$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ' | tail -n1)
  w_size=$(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | tail -n1 | sed s/,/x/g)
  cd ${outdir} && grim -g "$w_pos $w_size" - | tee "$filename" | wl-copy
  notify_view
}

shotarea() {
  tmpfile=$(mktemp)
  grim -g "$(slurp)" - >"$tmpfile"
  if [[ -s "$tmpfile" ]]; then
    wl-copy <"$tmpfile"
    mv "$tmpfile" "$outdir/$filename"
  fi
  rm "$tmpfile"
  notify_view
}

shotactive() {
  active_window_class=$(hyprctl -j activewindow | jq -r '(.class)')
  active_window_file="Screenshot_${time}_${active_window_class}.png"
  active_window_path="${outdir}/${active_window_file}"

  hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - "${active_window_path}"
  sleep 1
  notify_view "active"  
}

shotswappy() {
  tmpfile=$(mktemp)
  grim -g "$(slurp)" - >"$tmpfile" && notify_view "swappy"
  swappy -f - <"$tmpfile"
  rm "$tmpfile"
}


if [[ ! -d "$outdir" ]]; then
  mkdir -p "$outdir"
fi

if [[ "$1" == "--now" ]]; then
  shotnow
elif [[ "$1" == "--in5" ]]; then
  shot5
elif [[ "$1" == "--in10" ]]; then
  shot10
elif [[ "$1" == "--win" ]]; then
  shotwin
elif [[ "$1" == "--area" ]]; then
  shotarea
elif [[ "$1" == "--active" ]]; then
  shotactive
elif [[ "$1" == "--swappy" ]]; then
  shotswappy
else
  echo -e "Available Options : --now --in5 --in10 --win --area --active --swappy"
fi

exit 0

