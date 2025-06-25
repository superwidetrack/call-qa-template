#!/usr/bin/env bash
export N8N_PORT=${PORT:-5678}
exec /docker-entrypoint.sh n8n
