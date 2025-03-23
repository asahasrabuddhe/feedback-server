#!/bin/bash

echo "WARNING: This will remove all GitLab data and containers."
read -p "Are you sure you want to proceed? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Cleanup aborted."
    exit 0
fi

echo "Stopping GitLab containers..."
cd docker-compose/gitlab-server && docker-compose down -v

echo "Removing GitLab data directories..."
rm -rf docker-compose/gitlab-server/gitlab
rm -rf docker-compose/gitlab-server/gitlab-runner

echo "Cleanup completed successfully." 