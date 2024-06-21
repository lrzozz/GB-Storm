source $FUNCTION
import axeron.prop
local verName="V1.0-stable"
local version=10
local pid="[$$]"
local p="[-]"
local vcore="https://github.com/lrzozz/GB-Storm/core.sh"
local id="$(settings get secure android_id)"
local trim_id="${id:0:6}"

case $1 in
  --info )
    log_path="/sdcard/Android/data/${AXERONPKG}/files"
    log_file="${log_path}/log.txt"
    current_time=$(date +%s%3N)
    last_time=$(cat "$log_file" 2>/dev/null)
    time_diff=$((2700000 - (current_time - last_time)))
    echo "$pid $name | Informations"
    echo "➤ $p User ID: $trim_id"
    echo "➤ $p Version: $verName($version)"
    echo "➤ $p Package: ${runPackage:-null}"
    exit 0
    ;;
  --changelogs )
    storm +x "https://github.com/lrzozz/GB-Storm/vip/changelogs.sh" -fn "changelogs" "$@"
    exit 0
    ;;
esac

echo "$pid $name | $verName($version)"
echo "$p Thank You For Buy VIP"
storm +x "$vcore" -fn "core" "$@"
