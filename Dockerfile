FROM debian:jessie

# We need to add a debian repo to find php7

RUN apt-get update && \
    echo "deb http://packages.dotdeb.org jessie all" \
    >> /etc/apt/sources.list && \
    apt-get install -y apt-utils wget && \
    wget https://www.dotdeb.org/dotdeb.gpg && \
    apt-key add dotdeb.gpg && \
    rm dotdeb.gpg && \
    apt-get remove wget -y && \
    apt-get update -y && \
    apt-get install php7.0-cli -y

ENTRYPOINT ["php"]
CMD ["--help"]





