#!/bin/bash

# Wait for GitLab to be fully up
echo "Waiting for GitLab to be available..."
until curl -s http://gitlab:80 > /dev/null; do
    sleep 10
    echo "Still waiting..."
done

echo "GitLab is up, getting registration token..."

# Extract the GitLab Runner registration token
# You'll need to manually paste this from the GitLab Admin UI
# Admin Area > Overview > Runners

read -p "Enter the GitLab Runner registration token: " REGISTRATION_TOKEN

# Register the runner
docker exec -it gitlab-runner gitlab-runner register \
  --non-interactive \
  --url "http://gitlab" \
  --registration-token "$REGISTRATION_TOKEN" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "docker-runner" \
  --tag-list "docker,local" \
  --run-untagged="true" \
  --locked="false" \
  --docker-privileged="true" \
  --docker-network-mode="gitlab-network"

echo "GitLab Runner registered successfully!"