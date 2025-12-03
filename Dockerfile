FROM n8nio/n8n:1.122.4

# ตั้ง timezone
ENV GENERIC_TIMEZONE=Asia/Bangkok

# ใช้ entrypoint ของ n8n (default) → ไม่ต้อง COPY docker-entrypoint.sh
