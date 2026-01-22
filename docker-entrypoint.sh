#!/bin/sh
set -e

# ใช้ PORT จาก Render เป็นพอร์ตของ n8n
# fallback เป็น 5678 เมื่อรัน local
export N8N_PORT="${PORT:-5678}"

# ปิด runners หากยังไม่ใช้งาน
# export N8N_RUNNERS_DISABLED="${N8N_RUNNERS_DISABLED:-true}"

# เชื่อใจ proxy ทั้งหมด (จำเป็นบน Render / reverse proxy)
export N8N_TRUSTED_PROXIES="${N8N_TRUSTED_PROXIES:-0.0.0.0/0}"

# โปรโตคอล (Render terminate TLS ให้แล้ว ปกติใช้ http ภายใน)
export N8N_PROTOCOL="${N8N_PROTOCOL:-http}"

# ถ้าไม่ได้ตั้ง WEBHOOK_URL แต่มี N8N_HOST → ประกอบให้อัตโนมัติ
if [ -z "${WEBHOOK_URL}" ] && [ -n "${N8N_HOST}" ]; then
  export WEBHOOK_URL="${N8N_PROTOCOL}://${N8N_HOST}"
fi

# เริ่ม n8n
exec n8n start
