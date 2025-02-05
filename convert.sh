mkdir -p mp3s

for f in *.m4a;
do
    bitrate=$(avprobe "${f}" 2> >(grep bitrate) | sed 's/^.*bitrate://g' | sed 's/[^0-9]*//g')
    bitrate="${bitrate}K"
    new_filename=$(echo "${f}" | sed 's/.m4a$/.mp3/g')
 #   ffmpeg -y -i "${f}" -acodec libmp3lame -ab "${bitrate}" "mp3s/${new_filename}"
 	ffmpeg -i "${f}" -acodec libmp3lame -ab 256k "${f}.mp3"
done
