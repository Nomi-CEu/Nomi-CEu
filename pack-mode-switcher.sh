#!/usr/bin/env sh
set -e
echo -e "Nomifactory GTCEu Port / Pack mode switcher"

NORMAL_CFG=./config-overrides/normal
EXPERT_CFG=./config-overrides/expert
TARGET=./config

if [ -z "$1" ]; then
  echo -en "Set pack mode (Normal / Expert): "
  read MODE
else
  MODE="$1"
fi

case "$MODE" in
  N|n|normal)
    cp -rf "$NORMAL_CFG"/* "$TARGET"
    rm -f "$TARGET/globalgamerules.cfg"
    if [ -f "server.properties" ] && [ -f "server.properties.normal" ]; then
        mv "server.properties" "server.properties.expert"
        mv "server.properties.normal" "server.properties"
    fi
  ;;

  E|e|expert)
    cp -rf "$EXPERT_CFG"/* "$TARGET"
    if [ -f "server.properties" ] && [ -f "server.properties.expert" ]; then
        mv "server.properties" "server.properties.normal"
        mv "server.properties.expert" "server.properties"
    fi
  ;;

  *)
    echo -e "Error: Invalid mode $MODE"
    exit 1
  ;;
esac

echo "Done!"