#!/bin/sh
set -e

# Render uses PORT, fallback 5678 when running local
export N8N_PORT="${PORT:-5678}"

# Always disable runners unless truly using queue mode
export N8N_RUNNERS_DISABLED=true
unset N8N_RUNNERS_ENABLED

# Trust proxies
export N8N_TRUSTED_PROXIES="${N8N_TRUSTED_PROXIES:-0.0.0.0/0}"

# Force HTTPS
export N8N_PROTOCOL="${N8N_PROTOCOL:-https}"

# Auto-generate Webhook URL if missing
if [ -z "${WEBHOOK_URL}" ] && [ -n "${N8N_HOST}" ]; then
  export WEBHOOK_URL="${N8N_PROTOCOL}://${N8N_HOST}"
fi

exec n8n start
