FROM ubuntu:16.04

# Install base packages, ansible, nodejs
RUN apt-get update && apt-get -y install \
        curl \
        dnsutils \
        gcc \
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
RUN go get \
        github.com/GeertJohan/fgt \
        github.com/golang/lint/golint \
        github.com/govau/sdget \
        golang.org/x/tools/cmd/cover

# Install common NPM stuff, and:
# Fix bug https://github.com/npm/npm/issues/9863
RUN cd $(npm root -g)/npm && \
    npm install fs-extra && \
    sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js && \
    npm install -g yarn

# Install terraform
RUN bash -o pipefail -c "curl -L https://releases.hashicorp.com/terraform/0.10.7/terraform_0.10.7_linux_amd64.zip > /tmp/terraform.zip && unzip -q /tmp/terraform.zip -d /usr/local/bin && chmod 755 /usr/local/bin/terraform && rm /tmp/terraform.zip"
