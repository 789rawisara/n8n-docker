FROM n8nio/n8n:2.0.3

# ใช้ root เพื่อติดตั้ง entrypoint
USER root

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ตั้ง timezone (n8n ใช้ GENERIC_TIMEZONE)
ENV GENERIC_TIMEZONE=Asia/Bangkok

# กลับไปใช้ user เดิมของ n8n (ปลอดภัยกว่า)
USER node

# ใช้ entrypoint ของเรา
ENTRYPOINT ["docker-entrypoint.sh"]
