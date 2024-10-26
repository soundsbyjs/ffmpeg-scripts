# script to turn an mkv file into an mpg with burned in subtitles
# ily :3
for file in *.mkv; do
	# step 1, extract subtitles
	ffmpeg -i "$file" -map 0:s:0 subs.srt

	# ffmpeg -i video.avi -vf subtitles=subtitle.srt out.avi
	# https://trac.ffmpeg.org/wiki/HowToBurnSubtitlesIntoVideo
	ffmpeg -i "$file" -vf subtitles=subs.srt -codec:v mpeg2video -qscale:v 2 -codec:a mp2 -b:a 192k "${file%.mkv}.mpg"

done
