#!/bin/bash
# addsubs.sh - Embed subtitles into an MP4 using ffmpeg
ffmpeg -i "$1" -i "$2" -c copy -c:s mov_text "$3"

