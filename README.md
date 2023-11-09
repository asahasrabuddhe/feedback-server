# Self-Hosted Git Server with CI/CD

This project sets up a self-hosted development environment that includes:

1. A local GitLab server running in Docker
2. GitLab CI/CD pipeline configuration
3. Cloudflare Tunnel integration to make services publicly accessible

## Components

- **GitLab Server**: Self-hosted Git repository management
- **GitLab Runner**: CI/CD pipeline executor
- **Cloudflare Tunnel**: Secure public access to local services

## Directory Structure

```
.
├── docker-compose/
│   └── gitlab-server/
│       ├── docker-compose.yml
│       └── register-runner.sh
├── config/
│   └── cloudflared/
└── README.md
``` 