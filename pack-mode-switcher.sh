#!/usr/bin/env sh
set -e
echo -e "Nomifactory GTCEu Port / Pack mode switcher"

NORMAL_CFG=./config-overrides/normal
EXPERT_CFG=./config-overrides/expert
TARGET=./config

echo -en "Set pack mode (Normal / Expert): "
read MODE

case $MODE in
  N|n|normal)
    cp -rf "$NORMAL_CFG" "$TARGET"
    rm -f "$TARGET/globalgamerules.cfg"
  ;;

  E|e|expert)
    cp -rf "$EXPERT_CFG" "$TARGET"
  ;;

  *)
    echo -e "Error: Invalid mode $MODE"
    exit 1
  ;;
esac

echo "Done!"
