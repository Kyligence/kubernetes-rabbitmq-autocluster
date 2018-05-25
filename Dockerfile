FROM rabbitmq:latest

ENV RABBITMQ_USE_LONGNAME=true \
    AUTOCLUSTER_LOG_LEVEL=debug \
    AUTOCLUSTER_CLEANUP=true \
    CLEANUP_INTERVAL=60 \
    CLEANUP_WARN_ONLY=false \
    AUTOCLUSTER_TYPE=k8s \
    LANG=en_US.UTF-8 \
    RABBITMQ_SSL_CERTFILE=/usr/lib/rabbitmq/certs/cert.pem \
    RABBITMQ_SSL_KEYFILE=/usr/lib/rabbitmq/certs/key.pem \
    RABBITMQ_SSL_CACERTFILE=/usr/lib/rabbitmq/certs/cacert.pem

ADD plugins/*.ez /usr/lib/rabbitmq/lib/rabbitmq_server-*/plugins/
ADD certs/*.pem /usr/lib/rabbitmq/certs/
RUN rabbitmq-plugins enable --offline autocluster
