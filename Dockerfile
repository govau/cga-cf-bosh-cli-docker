FROM ubuntu:16.04

# Install base packages, ansible, nodejs
RUN apt-get update && apt-get -y install \
        curl \
        dnsutils \
        git \
        jq \
        software-properties-common \
        unzip \
        wget && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && apt-get -y install \
        ansible && \
    bash -o pipefail -c "curl -L https://deb.nodesource.com/setup_6.x | bash" && \
    apt-get -y install \
        nodejs && \
    rm -rf /var/lib/apt/lists/*

# Install bosh-cli
RUN curl -L https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.40-linux-amd64 > /usr/local/bin/bosh && \
    chmod a+x /usr/local/bin/bosh

# Install credhub-cli
RUN bash -o pipefail -c "curl -L https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.4.1/credhub-linux-1.4.1.tgz | tar -xz -C /usr/local/bin"

# Install modern golang
RUN bash -o pipefail -c "curl -L https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz | tar -xz -C /usr/local"

# Set Go environment variables
ENV GOROOT=/usr/local/go GOPATH=/go PATH=/go/bin:/usr/local/go/bin:$PATH

# Install glide
RUN mkdir -p /go/bin && \
    bash -o pipefail -c "curl https://glide.sh/get | sh"

# Install go tools
RUN go get github.com/govau/sdget
