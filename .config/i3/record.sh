#!/usr/bin/env bash

record() {
  # Generic command to record at your screen dimensions
  ffmpeg -f x11grab -s 1360x768 -framerate 60 -i :0.0 \
       -f pulse -i default \
       -c:v libx264 -preset veryfast -tune zerolatency -b:v 3500k -maxrate 3500k -minrate 3500k -bufsize 3500k -g 60 \
       -c:a aac -b:a 128k \
        -f flv "rtmp://live.twitch.tv/app/live_887634316_A3GmXS2mk7xVAOKG5K3LAJSyvhlR10"
        &
  echo $! > /tmp/recpid


  notify-send -t 500 -h string:bgcolor:#a3be8c "Recording started & mic toggled"
  }

end() {
  kill -15 "$(cat /tmp/recpid)" && rm -f /tmp/recpid 



  notify-send -t 500 -h string:bgcolor:#bf616a "Recording ended & mic toggled"
  }

# If the recording pid exists, end recording. If not, start recording
([[ -f /tmp/recpid ]] && end && exit 0) || record
