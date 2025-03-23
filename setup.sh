#!/bin/bash

# Setup script for the local development environment
echo "Setting up local development environment..."

# Check if Docker is running
if ! docker info >/dev/null 2>&1; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if Cloudflare CLI is installed
if ! command -v cloudflared &> /dev/null; then
    echo "Installing Cloudflare CLI..."
    brew install cloudflared
fi

# Create required directories if they don't exist
mkdir -p docker-compose/gitlab-server/gitlab/{config,logs,data}
mkdir -p docker-compose/gitlab-server/gitlab-runner/config

# Make all scripts executable
chmod +x docker-compose/gitlab-server/register-runner.sh
chmod +x config/cloudflared/start-tunnel.sh

echo "Setup completed successfully!"
echo "To start the services, run:"
echo "  make start-gitlab  - To start GitLab server and runner"
echo "  make start-tunnel  - To start Cloudflare Tunnel" 