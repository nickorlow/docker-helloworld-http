FROM debian:jessie

LABEL maintainer "opsxcq@strm.sh"

RUN apt-get update && \
    apt-get upgrade -y --force-yes && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes \
    python &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY main.sh /
RUN mkdir /www

EXPOSE 80

WORKDIR /www

ENTRYPOINT ["/main.sh"]

