# AWS CLI in Docker

Containerized AWS CLI on alpine to avoid requiring the aws cli to be installed on CI machines.

## Build

```
docker build -t mesosphere/aws-cli .
```

Automated build on Docker Hub

[![DockerHub Badge](http://dockeri.co/image/mesosphere/aws-cli)](https://hub.docker.com/r/mesosphere/aws-cli/)

## Usage

Configure:

```
export AWS_ACCESS_KEY_ID="<id>"
export AWS_SECRET_ACCESS_KEY="<key>"
export AWS_DEFAULT_REGION="<region>"
```

Upload file to S3:

```
./aws.sh s3 cp ../dcos-centos-virtualbox-0.2.1.box s3://downloads.dcos.io/dcos-vagrant/
```

## References

AWS CLI Docs: https://aws.amazon.com/documentation/cli/


# License

Copyright 2016 Mesosphere, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this repository except in compliance with the License.

The contents of this repository are solely licensed under the terms described in the [LICENSE file](./LICENSE) included in this repository.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
