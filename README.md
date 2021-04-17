# node-kaniko
A docker image with nodejs and kaniko to build docker images without elevated permissions needed by docker in docker. 

## Supported tags 

`latest`, `current` run nodejs current version
`lts` run nodejs lts version

## Usage

This image works similarly to the kanico official image with the exception of the entrypoint that is `sh` instead of `kaniko/executor`.

```sh-session
# Example of usage
docker run -ti --rm -v `pwd`:/workspace overbit/kaniko-node:lts --dockerfile=Dockerfile --destination=destination-image-name
```

[Kanico docs](https://github.com/GoogleContainerTools/kaniko)