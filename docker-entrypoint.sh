#!/bin/sh
set -e

export N8N_PORT="${PORT:-5678}"
export N8N_TRUSTED_PROXIES="${N8N_TRUSTED_PROXIES:-0.0.0.0/0}"
export N8N_PROTOCOL="${N8N_PROTOCOL:-https}"

if [ -z "${WEBHOOK_URL}" ] && [ -n "${N8N_HOST}" ]; then
  export WEBHOOK_URL="${N8N_PROTOCOL}://${N8N_HOST}"
fi

echo "Starting n8n on port: ${N8N_PORT}"
exec n8n start
