#!/bin/sh
set -e  # Exit on errors

echo "Starting entrypoint.sh for Chronograf"

# Ensure directories exist
if [ ! -d /var/lib/chronograf ]; then
    echo "Creating /var/lib/chronograf"
    mkdir -p /var/lib/chronograf
fi
chmod 775 /var/lib/chronograf
echo "Checked /var/lib/chronograf"

# Fallback if no command is passed
if [ "$#" -eq 0 ]; then
    echo "No command provided. Starting default 'chronograf' process..."
    exec chronograf
else
    echo "Executing provided command: $@"
    exec "$@"
fi