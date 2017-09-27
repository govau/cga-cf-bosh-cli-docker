# Cloud Foundry BOSH CLI v2 deployed using docker

Provides a docker image with the BOSH CLI v2, and other useful tools for cloud.gov.au

This repo is automatically built on [docker hub](https://hub.docker.com/r/govau/cga-cf-bosh-cli-docker/).

### How to get it?

Pull the image from docker hub:

```
docker pull govau/cga-cf-bosh-cli-docker
```

### How to build it locally?

*Assumes you have docker running locally*

1. Clone this repository:

```
git clone https://github.com/govau/cga-cf-bosh-cli-docker.git
```

2. Build the image:

```
docker build cga-cf-bosh-cli-docker
```
