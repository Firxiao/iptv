# usage: separate m3u list to single file
# author: Firxiao
m3u_file="$1"
m3u_dir="$(echo $1|cut -d . -f 1)"

mkdir -p $m3u_dir

cat $m3u_file|while read line
do
    if echo $line|grep -q 'EXTM3U'; then
         echo $line
    elif echo $line|grep -q "EXTINF"; then
        file=$(echo $line|cut -d , -f2)
        echo $line > $m3u_dir/${file}.m3u
    else
        echo $line >> $m3u_dir/${file}.m3u
    fi
done
