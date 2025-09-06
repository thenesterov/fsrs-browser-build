FROM rust:slim AS builder

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN rustup component add rust-src --toolchain nightly-2025-04-25-x86_64-unknown-linux-gnu

WORKDIR /app

RUN git clone https://github.com/open-spaced-repetition/fsrs-browser . \
    && git submodule init \
    && git submodule update --init --recursive

RUN chmod +x prod.sh
RUN ./prod.sh

RUN mkdir -p /output && \
    cp -r pkg/* /output/ 2>/dev/null || \
    cp -r dist/* /output/ 2>/dev/null || \
    echo "No output files found"

