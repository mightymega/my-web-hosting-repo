#!/bin/bash

# Run welcome message
./welcome.sh

# Check if PHP is installed, and start PHP's built-in server if it is
if command -v php >/dev/null 2>&1; then
    echo "Starting PHP server..."
    php -S localhost:8000 -t public &
    echo "Your site is hosted at: http://localhost:8000"
else
    # If PHP is not installed, check for Python
    if command -v python3 >/dev/null 2>&1; then
        echo "Starting Python server..."
        cd public
        python3 -m http.server 8000 &
        echo "Your site is hosted at: http://localhost:8000"
    else
        echo "Neither PHP nor Python3 is installed. Please install one to proceed."
        exit 1
    fi
fi
