FROM ubuntu:16.04

RUN apt-get update && apt-get -y install git unzip wget jq

# We manually install go as the apt version (1.6) is too old for sdget
ADD scripts/go.sh /etc/profile.d/
RUN wget -nv -O /tmp/go.tar.gz https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz && tar -xzf /tmp/go.tar.gz -C /usr/local && chmod 755 /etc/profile.d/go.sh && rm -f /tmp/go.tar.gz

# Install bosh-cli
RUN wget -nv -O /usr/local/bin/bosh "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.40-linux-amd64"
RUN chmod +x /usr/local/bin/bosh

# Install sdget
RUN export GOPATH=/tmp && export PATH=$PATH:/usr/local/go/bin && \
    go get -v github.com/govau/sdget && mv /tmp/bin/sdget /usr/local/bin/sdget && chmod 755 /usr/local/bin/sdget
