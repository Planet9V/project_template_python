#!/bin/bash

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3.10 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Install base requirements
pip install --upgrade pip
pip install -r requirements/base.txt

# Install development requirements if in dev mode
if [ "$1" = "dev" ]; then
    pip install -r requirements/dev.txt
fi

# Install tree if not present
if ! command -v tree &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y tree
fi

# Create necessary directories if they don't exist
mkdir -p src tests docs/{api,user} notebooks/examples

# Display project structure
tree -L 3 -I 'venv|__pycache__|*.pyc'
