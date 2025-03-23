# Deployment Guide

This document provides instructions for deploying the application using the local GitLab server and CI/CD pipeline.

## Prerequisites

- Docker and Docker Compose installed
- Cloudflare account (for Tunnel setup)
- Make utility installed

## Setup Steps

1. Run the setup script to prepare the environment:
   ```
   ./setup.sh
   ```

2. Start the GitLab server:
   ```
   make start-gitlab
   ```

3. Once GitLab is running (may take a minute or two), access it at http://localhost:8080
   - Default username: `root`
   - Get the initial password by running:
     ```
     docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
     ```

4. Set up GitLab Runner:
   - Go to GitLab Admin area > CI/CD > Runners
   - Copy the registration token
   - Run the registration script:
     ```
     cd docker-compose/gitlab-server
     ./register-runner.sh
     ```
   - Enter the registration token when prompted

5. Set up Cloudflare Tunnel:
   - Log in to your Cloudflare account
   - Create a new tunnel and download the credentials file
   - Place the credentials file at `config/cloudflared/cert.pem`
   - Update the tunnel ID in `config/cloudflared/config.yml`
   - Start the tunnel:
     ```
     make start-tunnel
     ```

## Pushing Code to Local GitLab

1. Create a new project in GitLab
2. Add the local GitLab as a remote:
   ```
   git remote add gitlab http://localhost:8080/root/your-project-name.git
   ```
3. Push your code:
   ```
   git push -u gitlab main
   ```

## Monitoring Deployment

1. Go to your GitLab project > CI/CD > Pipelines to monitor the deployment
2. Once deployed, the application will be available at the URL configured in Cloudflare Tunnel 