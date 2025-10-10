#!/bin/bash
# This script logs the current date and time every minute to a log file.

LOGFILE="/var/log/hello_service.log"

while true; do
    echo "Hello Service: $(date)" >> "$LOGFILE"
    sleep 60
done
