#!/bin/bash

# Exit on errors
set -e

# Check if Python3.12 is installed, if not install it
if ! command -v python3.12 &> /dev/null
then
    echo "Python3.12 not found, installing..."
    apt-get update
    apt-get install -y python3.12 python3.12-venv python3.12-dev
    # Ensure pip for Python 3.12 is installed
    curl https://bootstrap.pypa.io/get-pip.py | python3.12
fi

# Install project dependencies
python3.12 -m pip install -r requirements.txt

# Collect static files
python3.12 manage.py collectstatic --noinput

# Create directory for static files build
mkdir -p staticfiles_build

# Copy static files to the build directory
cp -r static/* staticfiles_build/
