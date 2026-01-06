#!/bin/bash

#  Decription
#  ----------
#  Prints top 10 track of artist

#  Author: Dmitry (http://dmi3.net)
#  Source: https://github.com/dmi3/bin

#  Usage
#  -----
#  top10tracks.sh Mick Gordon

artist=$(printf '%s' "$*" | jq -s -R -r @uri)
curl -s "https://api.deezer.com/search/artist?q=$artist" \
      | jq -r '.data[0].id' \
      | xargs -I{} curl -s "https://api.deezer.com/artist/{}/top?limit=10" \
      | jq -r '.data[] | "\(.artist.name) - \(.title)"'
