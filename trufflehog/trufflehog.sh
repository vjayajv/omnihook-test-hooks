#!/bin/sh

# Check if trufflehog is installed
if ! command -v trufflehog >/dev/null 2>&1; then
    echo "trufflehog not found. Attempting to install..."
    pip install trufflehog || pip3 install trufflehog || {
        echo "Failed to install trufflehog using pip"
        exit 1
    }
fi

# Run trufflehog excluding .git directory
trufflehog filesystem . --exclude-paths .git --fail