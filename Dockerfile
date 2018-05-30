FROM rabbitmq:3.6.8

ENV RABBITMQ_USE_LONGNAME=true \
    AUTOCLUSTER_LOG_LEVEL=debug \
    AUTOCLUSTER_CLEANUP=true \
    CLEANUP_INTERVAL=60 \
    CLEANUP_WARN_ONLY=false \
    AUTOCLUSTER_TYPE=k8s \
    LANG=en_US.UTF-8 \
    RABBITMQ_SSL_CERTFILE=/certs/cert.pem \
    RABBITMQ_SSL_KEYFILE=/certs/key.pem \
    RABBITMQ_SSL_CACERTFILE=/certs/cacert.pem

ADD plugins/*.ez /plugins/
ADD certs/*.pem /certs/
RUN rabbitmq-plugins enable --offline autocluster
