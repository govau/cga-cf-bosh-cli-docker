# Cloud Foundry BOSH CLI v2 deployed using docker [![Docker Automated build](https://img.shields.io/docker/automated/govau/cga-cf-bosh-cli.svg?style=plastic)](https://hub.docker.com/r/govau/cga-cf-bosh-cli/)

Provides a docker image with the BOSH CLI v2, and other useful build tools for cloud.gov.au

This repo is automatically built on [docker hub](https://hub.docker.com/r/govau/cga-cf-bosh-cli/).

### How to get it?

Pull the image from docker hub:

```
docker pull govau/cga-cf-bosh-cli
```

### How to build it locally?

*Assumes you have docker running locally*

1. Clone this repository:

```
git clone https://github.com/govau/cga-cf-bosh-cli.git
```

2. Build the image:

```
docker build cga-cf-bosh-cli
```
