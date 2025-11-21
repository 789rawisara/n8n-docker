#!/bin/sh
set -e

# ใช้ PORT ของ Render เป็นพอร์ตของ n8n (fallback 5678 ตอนรัน local)
export N8N_PORT="${PORT:-5678}"

# ปิด runners ถ้ายังไม่ใช้
export N8N_RUNNERS_DISABLED="${N8N_RUNNERS_DISABLED:-true}"

# เชื่อใจ proxy ทั้งหมด (แก้ X-Forwarded-For บน Render)
export N8N_TRUSTED_PROXIES="${N8N_TRUSTED_PROXIES:-0.0.0.0/0}"

# บังคับ HTTPS บน Render (สำคัญมากสำหรับ webhook / OAuth callback)
export N8N_PROTOCOL="${N8N_PROTOCOL:-http}"

# ถ้าไม่ได้ตั้ง WEBHOOK_URL แต่มี N8N_HOST ให้ประกอบ URL อัตโนมัติ
if [ -z "${WEBHOOK_URL}" ] && [ -n "${N8N_HOST}" ]; then
  export WEBHOOK_URL="${N8N_PROTOCOL}://${N8N_HOST}"
fi

# เริ่มรัน n8n
exec n8n start
