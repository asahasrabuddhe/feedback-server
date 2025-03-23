.PHONY: start-gitlab stop-gitlab start-tunnel stop-all

# Start GitLab server and runner
start-gitlab:
	@echo "Starting GitLab server and runner..."
	cd docker-compose/gitlab-server && docker compose up -d
	@echo "GitLab will be available at http://localhost:8080"
	@echo "Default username: root"
	@echo "Default password: Check initial root password with: docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password"

# Stop GitLab server and runner
stop-gitlab:
	@echo "Stopping GitLab server and runner..."
	cd docker-compose/gitlab-server && docker compose down

# Start Cloudflare Tunnel
start-tunnel:
	@echo "Starting Cloudflare Tunnel..."
	./config/cloudflared/start-tunnel.sh

# Stop all services
stop-all: stop-gitlab
	@echo "Stopping all services..."
	@echo "Cloudflare Tunnel must be stopped manually with Ctrl+C in its terminal window."

# Help command
help:
	@echo "Available commands:"
	@echo "  make start-gitlab  - Start GitLab server and runner"
	@echo "  make stop-gitlab   - Stop GitLab server and runner"
	@echo "  make start-tunnel  - Start Cloudflare Tunnel"
	@echo "  make stop-all      - Stop all services"
	@echo "  make help          - Show this help message" 