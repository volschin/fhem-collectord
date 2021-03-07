#!/bin/sh

echo "Starting FHEM collectord ..."
rm -f /run/collectord.pid
exec /collectord -c /collectord.conf -v
