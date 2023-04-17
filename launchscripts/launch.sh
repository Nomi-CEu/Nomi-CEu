#!/bin/sh

# Server Launch Script
#
# Thrown together by Neeve in under five minutes, Public Domain
# https://github.com/Neeve01
#
# Fixed and added java version check by t0suj4, Public Domain
# https://github.com/t0suj4

# DO NOT EDIT UNLESS YOU KNOW WHAT YOU'RE DOING
FORGEJAR='{{{forgeJar}}}'
JAVA_PARAMETERS='{{{jvmArgs}}}'

# these you can edit
MIN_RAM='{{{minRAM}}}'
MAX_RAM='{{{maxRAM}}}'

# DO NOT EDIT ANYTHING PAST THIS LINE
LAUNCHPARAMS="-server -Xms$MIN_RAM -Xmx$MAX_RAM $JAVA_PARAMETERS -Dlog4j.configurationFile=log4j2_112-116.xml -jar $FORGEJAR nogui"

echo "Checking java version..."
echo
java -version
echo
echo "The expected java version is 1.8. Not higher, not lower."
echo

echo "Launching the server..."
echo
echo "> java $LAUNCHPARAMS"

java $LAUNCHPARAMS

echo
echo "- The server has stopped. If it's a crash, please read the output above."
echo
read -p "- Press Return to exit..." _
