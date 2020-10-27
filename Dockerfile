FROM alpine:3.11

LABEL maintainer="Kristoffer Ahl <kristoffer.ahl@dotnetmentor.se>"

ENV PACKAGE_VERSION="v3.0.2"
ENV KUBECTL_VERSION="v1.15.5"

RUN apk add --no-cache bash curl

RUN	curl -Lf -o /usr/bin/lifecycled https://github.com/buildkite/lifecycled/releases/download/${PACKAGE_VERSION}/lifecycled-linux-amd64 && \
	chmod +x /usr/bin/lifecycled

RUN curl -Lf -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
	chmod +x /usr/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
