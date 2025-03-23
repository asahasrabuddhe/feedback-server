# Self-Hosted Git Server with CI/CD

This project sets up a self-hosted development environment that includes:

1. A local GitLab server running in Docker
2. GitLab CI/CD pipeline configuration
3. Cloudflare Tunnel integration to make services publicly accessible

## Features

- **Local GitLab Server**: Full GitLab functionality running on your laptop
- **Integrated CI/CD**: Automated testing and deployment with GitLab Runner
- **Public Access**: Make your local development environment accessible over the internet using Cloudflare Tunnel
- **Simplified Management**: Easy-to-use scripts and Makefile commands

## Quick Start

1. Run the setup script:
   ```
   ./setup.sh
   ```

2. Start the GitLab server:
   ```
   make start-gitlab
   ```

3. Access GitLab at http://localhost:8080

4. Configure Cloudflare Tunnel and start it:
   ```
   make start-tunnel
   ```

For detailed instructions, see [Deployment Guide](docs/DEPLOYMENT.md).

## Directory Structure

```
.
├── app/                        # Sample application
│   ├── index.html              # Demo web page
│   └── gitlab-ci.yml           # CI/CD configuration
├── config/
│   └── cloudflared/            # Cloudflare Tunnel configuration
│       ├── config.yml          # Tunnel routing rules
│       └── start-tunnel.sh     # Script to start the tunnel
├── docker-compose/
│   └── gitlab-server/          # GitLab server configuration
│       ├── docker-compose.yml  # Docker configuration for GitLab
│       └── register-runner.sh  # Script to register GitLab Runner
├── docs/                       # Documentation
│   └── DEPLOYMENT.md           # Detailed deployment guide
├── Makefile                    # Convenience commands
├── setup.sh                    # Environment setup script
├── cleanup.sh                  # Environment cleanup script
└── README.md                   # This file
```

## Cleaning Up

To remove all containers and data, run:
```
./cleanup.sh
``` 