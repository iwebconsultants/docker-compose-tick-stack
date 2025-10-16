#!/bin/sh
set -e  # Exit on errors

echo "Starting entrypoint.sh"

# Ensure directories exist
if [ ! -d /var/lib/kapacitor ]; then
    echo "Creating /var/lib/kapacitor"
    mkdir -p /var/lib/kapacitor
fi
chmod 775 /var/lib/kapacitor
echo "Checked /var/lib/kapacitor"

# Ensure config file exists
if [ ! -f /etc/kapacitor/kapacitor.conf ]; then
    echo "Creating default /etc/kapacitor/kapacitor.conf"
    echo "# Default kapacitor config" > /etc/kapacitor/kapacitor.conf
fi
echo "Checked /etc/kapacitor/kapacitor.conf"

# Fallback if no command is passed
if [ "$#" -eq 0 ]; then
    echo "No command provided. Starting default 'kapacitord' process..."
    exec kapacitord -config /etc/kapacitor/kapacitor.conf
else
    echo "Executing provided command: $@"
    exec "$@"
fi