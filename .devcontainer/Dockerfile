ARG VARIANT=22-bookworm
FROM mcr.microsoft.com/devcontainers/javascript-node:1-${VARIANT}

RUN apt-get update \
	&& export DEBIAN_FRONTEND=noninteractive \
	&& apt-get install -y --no-install-recommends git-lfs openssh-client \
	&& git lfs install --system \
	&& npm install -g npm@11 \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
