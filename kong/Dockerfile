FROM kong/kong-gateway:3.14-ubuntu

USER root

# Install debugging software packages
ENV DEBIAN_FRONTEND=noninteractive
RUN set -x \
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
    wget curl iproute2 iputils-ping netcat-openbsd less vim

USER kong

COPY kong.conf /etc/kong/kong.conf
COPY kong.yml /etc/kong/kong.yml
