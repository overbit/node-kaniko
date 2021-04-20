FROM alpine

# nodejs version: CURRENT or LTS 
ARG NODE_VERSION=CURRENT 

RUN if [[ "$NODE_VERSION" == "LTS" ]]; then \
        apk add --update nodejs npm yarn git bash; \
    elif [[ "$NODE_VERSION" == "CURRENT" ]]; then \
        apk add --update nodejs-current npm yarn git bash; \
    else \
        exit 1; \
    fi

COPY --from=gcr.io/kaniko-project/executor:debug /kaniko/ /kaniko/

ENV PATH $PATH:/kaniko
ENV HOME /root
ENV USER root
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json

WORKDIR /workspace
RUN ["docker-credential-gcr", "config", "--token-source=env"]
ENTRYPOINT ["sh"]