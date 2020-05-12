#!/bin/sh

echo "Starting FHEM collectord ..."
rm -f /run/collectord.pid
/collectord -c /collectord.conf -v
