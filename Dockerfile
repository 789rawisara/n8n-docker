FROM n8nio/n8n:2.0.3

USER root

# ใส่ entrypoint ของเราเข้าไป
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ตั้ง timezone (n8n อ่าน GENERIC_TIMEZONE)
ENV GENERIC_TIMEZONE=Asia/Bangkok

# Render จะส่ง PORT มาให้ (เราเอาไปใช้ใน entrypoint)
EXPOSE 5678

USER node

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
