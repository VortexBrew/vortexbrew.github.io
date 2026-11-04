#!/bin/sh
# Pulls the exploit engine that the pages above drive.
set -e
mkdir -p patches

BASE=https://raw.githubusercontent.com/StarlightShade15/raw13g-auto-exploit/main

for f in jb.js core.js mem.js int64.js ps4_offsets.js rpc_worker.js \
         payload2.bin goldhen.bin cache.appcache; do
  curl -fLO "$BASE/$f"
done
for p in 1302.bin 1350.bin 1352.bin; do
  curl -fLo "patches/$p" "$BASE/patches/$p"
done

echo "OK - folder is complete. Deploy everything to Netlify."