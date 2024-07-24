#!/bin/bash

# Exit on errors
set -e

# Debug: Print the current PATH
echo "Current PATH: $PATH"

# Check if Python3.12 is installed
if ! command -v python3.12 &> /dev/null
then
    echo "Python3.12 not found. Please ensure Python 3.12 is available in the environment."
    exit 1
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
echo "Virtual environment activated."

# Upgrade pip within the virtual environment
python3.12 -m pip install --upgrade pip

# Install project dependencies
python3.12 -m pip install -r requirements.txt

# Collect static files
python3.12 manage.py collectstatic --noinput

# Create directory for static files build
mkdir -p staticfiles_build

# Copy static files to the build directory
cp -r static/* staticfiles_build/

