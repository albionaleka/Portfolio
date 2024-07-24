#!/bin/bash

# Exit on errors
set -e

# Debug: Print the current PATH
echo "Current PATH: $PATH"

# Check if Python3.12 is installed, if not install it
if ! command -v python3.12 &> /dev/null
then
    echo "Python3.12 not found, installing..."
    apt-get update
    apt-get install -y python3.12 python3.12-venv python3.12-dev
    # Ensure pip for Python 3.12 is installed
    curl https://bootstrap.pypa.io/get-pip.py | python3.12
fi

# Debug: Verify Python and pip installation
echo "Python version: $(python3.12 --version)"
echo "Pip version: $(python3.12 -m pip --version)"

# Create a virtual environment
python3.12 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Debug: Print the Python executable path to ensure the virtual environment is active
echo "Using Python from: $(which python3.12)"

# Install project dependencies
python3.12 -m pip install -r requirements.txt

# Collect static files
python3.12 manage.py collectstatic --noinput

# Create directory for static files build
mkdir -p staticfiles_build

# Copy static files to the build directory
cp -r static/* staticfiles_build/
