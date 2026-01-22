FROM n8nio/n8n:2.0.3

USER root
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENV GENERIC_TIMEZONE=Asia/Bangkok

EXPOSE 5678

USER node
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
