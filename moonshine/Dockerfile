ARG TARGETARCH
FROM ghcr.io/home-assistant/amd64-base-debian:bookworm AS amd64
FROM ghcr.io/home-assistant/aarch64-base-debian:bookworm AS arm64

FROM ${TARGETARCH}

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
# Needed to allow us to pip install over system packages, this makes sense since it's a single purpose container.
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# Installl essential build tools
RUN apt-get update && \
    apt-get install -y \
    cmake \
    build-essential \
    patchelf

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/


# Create a non-root user (optional but recommended)
RUN useradd -m -s /bin/bash user && \
    chown -R user:user /home/user

# Set Python 3 as default python
RUN echo 'alias python=python3' >> ~/.bashrc && \
    echo 'alias pip=pip3' >> ~/.bashrc

# Make sure we have build tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        netcat-traditional git && \
    git clone --depth 1 https://github.com/holdenk/wyoming-moonshine-ext.git --branch moonshine-0.0.1 && \
    uv pip install --system "wyoming[zeroconf]==1.8.0" 'transformers==4.52.4' 'onnx-asr[cpu,hub]==0.7.0' && \
    uv pip install --system -e ./wyoming-moonshine-ext && \
    uv pip install --system --index-url 'https://download.pytorch.org/whl/cpu' 'torch==2.6.0' && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY rootfs /

HEALTHCHECK --start-period=10m \
    CMD echo '{ "type": "describe" }' \
        | nc -w 1 localhost 10300 \
        | grep -q "faster-whisper" \
        || exit 1
