#!/bin/sh
set -e

# Render inject PORT (fallback local)
export N8N_PORT="${PORT:-5678}"

# Render อยู่หลัง reverse proxy
export N8N_TRUSTED_PROXIES="${N8N_TRUSTED_PROXIES:-0.0.0.0/0}"

# บังคับ https บน Render (ของจริงควรเป็น https)
export N8N_PROTOCOL="${N8N_PROTOCOL:-https}"

# ถ้าตั้ง N8N_HOST เช่น n8n-docker-1-sdas.onrender.com
# จะประกอบ WEBHOOK_URL ให้
if [ -z "${WEBHOOK_URL}" ] && [ -n "${N8N_HOST}" ]; then
  export WEBHOOK_URL="${N8N_PROTOCOL}://${N8N_HOST}"
fi

# (แนะนำ) ตั้ง editor base ให้ตรง domain ด้วย (กันลิงก์เพี้ยนบางจุด)
if [ -z "${N8N_EDITOR_BASE_URL}" ] && [ -n "${WEBHOOK_URL}" ]; then
  export N8N_EDITOR_BASE_URL="${WEBHOOK_URL}"
fi

exec n8n start
