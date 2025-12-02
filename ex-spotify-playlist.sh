#!/bin/bash

#  Export playlists from Spotify without giving credentials to shady sites (to avoid your Spotify credentials be stolen and resold to someone in different timezone)
#  
#  Converts Spotify playlist from "Song Links" list:
#  
#      https://open.spotify.com/track/6autdCG3xl7gzoiDCEB2HN
#      https://open.spotify.com/track/4q6RvRkXquQ965hubV58lb
#      https://open.spotify.com/track/01pzLOA8rQLfoodUCLc2wj
#  
#  To "Track - Artist" list:
#  
#      Nerevar Rising - Jeremy Soule
#      Arcanum - NewEnglandStringQuartet
#      Wilderness - Matt Uelmen    

#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/bin)
  
#  Requirements
#  ------------
#      sudo apt-get install libxml2-utils

#  Usage
#  ------------
#  1. Open Spotify app
#  2. Open playlist or "Songs" view
#  3. Select all tracks `Ctrl+A`
#  4. Copy track urls `Ctrl+C`
#  5. Paste into file and save
#  6. `cat /path/to/file | ex-spotify-playlist.sh`

while IFS= read -r url; do
  curl -s "$url" | xmllint --html --recover --xpath "concat(string(//meta[@name='music:musician_description']/@content), ' - ', string(//meta[@property='og:title']/@content))" - 2>/dev/null
done
