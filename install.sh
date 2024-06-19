source $FUNCTION
import axeron.prop
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"
local vip="https://github.com/lrzozz/GB-Storm/vip/install.sh"
local id="$(settings get secure android_id)"
local check_id="$(storm https://github.com/lrzozz/GB-Storm/id_vip.txt)"
local trim_id="${id:0:6}"
local vip_version=$(echo "$check_id" | grep -q "$trim_id" && echo true || echo false)
if [ $vip_version = true ]; then
   storm +x "$vip" -fn "install.sh" "$@"
   exit 0
fi

case $1 in
  --info )
    echo "$name | Informations"
    echo "User ID: $trim_id"
    exit 0
    ;;
  --changelogs )
    storm +x "https://github.com/lrzozz/GB-Storm/changelogs.sh" -fn "changelogs" "$@"
    exit 0
    ;;
esac

echo "$name | Free Version"
echo "Need more features? Buy VIP \$2"
storm +x "$core" -fn "core" "$@"