FROM ubuntu:latest
MAINTAINER Jeffrey Cao <qingcongke@gmail.com>

RUN apt-get update && \ 
    apt-get install -y --no-install-recommends wget git gcc && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*


RUN echo "Install Golang" && \
    wget --no-check-certificate -P /tmp https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf /tmp/go1.12.6.linux-amd64.tar.gz && \
    rm /tmp/go1.12.6.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

RUN echo "Install IPFS" && \
    wget --no-check-certificate -P /tmp https://dist.ipfs.io/go-ipfs/v0.4.21/go-ipfs_v0.4.21_linux-amd64.tar.gz && \
    tar -C /tmp -xzf /tmp/go-ipfs_v0.4.21_linux-amd64.tar.gz && \
    cd /tmp/go-ipfs && ./install.sh && \
    rm -rf /tmp/go-ipfs && \
    rm /tmp/go-ipfs_v0.4.21_linux-amd64.tar.gz





