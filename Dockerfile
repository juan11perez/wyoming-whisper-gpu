# https://github.com/edurenye/wyoming-addons-gpu/blob/gpu/docker-compose.gpu.yml - modified the dockerfile to add the gpu directly onto base yaml
# FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04
FROM nvidia/cuda:12.3.2-cudnn9-runtime-ubuntu22.04

# Install Whisper
WORKDIR /usr/src
ARG WYOMING_WHISPER_VERSION='2.4.0'

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-dev \
        python3-pip \
    \
    && pip3 install --no-cache-dir -U \
        setuptools \
        wheel \
    && pip3 install --no-cache-dir \
        --extra-index-url https://www.piwheels.org/simple \
        "wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/v${WYOMING_WHISPER_VERSION}.tar.gz" \
    \
    && apt-get purge -y --auto-remove \
        build-essential \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY run.sh ./

EXPOSE 10300

ENTRYPOINT ["bash", "/run.sh"]