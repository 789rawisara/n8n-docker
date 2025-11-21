FROM n8nio/n8n:1.116.2

# ใช้ root ชั่วคราวเพื่อติดตั้ง entrypoint
USER root
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# คืนไปใช้ user เดิมของอิมเมจ (ปลอดภัยกว่า)
USER node

# ตั้ง timezone แอป (n8n อ่าน GENERIC_TIMEZONE)
ENV GENERIC_TIMEZONE=Asia/Bangkok

# ใช้ entrypoint ของเรา (จะ export env และเรียก n8n start)
ENTRYPOINT ["docker-entrypoint.sh"]
