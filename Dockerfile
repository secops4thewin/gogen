FROM ubuntu:20.04
ADD build/linux/gogen /usr/bin/gogen
RUN chmod 755 /usr/bin/gogen
RUN sh -c 'echo dash dash/sh boolean false | debconf-set-selections' && \
    sh -c 'DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash' && \
    apt-get update && \
    apt-get install -y vim curl ca-certificates jq netcat && \
    rm -rf /var/lib/apt/lists/*
ADD entrypoint.sh /sbin/entrypoint.sh
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start"]