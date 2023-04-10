#!/usr/bin/env sh
touch .mode
set -e
echo "Nomifactory GTCEu Port / Pack mode switcher"

NORMAL_CFG=config-overrides/normal
EXPERT_CFG=config-overrides/expert
TARGET=./config
CURRENT_MODE="$(head .mode)"
CURRENT_MODE=${CURRENT_MODE:="normal"}

echo "Current Mode: $CURRENT_MODE"

if [ -z "$1" ]; then
  echo -n "Set pack mode (Normal / Expert): "
  read MODE
else
  MODE="$1"
fi

case $MODE in
    N|n|normal)

    cp -rf "$NORMAL_CFG/." ${TARGET} 

    # Only copy server.properties if it exists.
    if [ -f "server.properties" ]; then
        mv "${TARGET}/server.properties" ./
    else
        rm "${TARGET}/server.properties"
    fi

    # Update Mode
    echo normal > .mode
  ;;

  E|e|expert)

    cp -rf "$EXPERT_CFG/." ${TARGET}

    if [ -f "server.properties" ]; then
        mv "${TARGET}/server.properties" ./
    else
        rm "${TARGET}/server.properties"
    fi

    # Update Mode
    echo expert > .mode
  ;;

  *)
    echo -e "Error: Invalid input $MODE"
    exit 1
  ;;
esac

echo "Done!"
