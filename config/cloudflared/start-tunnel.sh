#!/bin/bash

# Start Cloudflare Tunnel in daemon mode
cloudflared tunnel --config config/cloudflared/config.yml run 