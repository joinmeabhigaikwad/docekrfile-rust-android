FROM alpine:3.18

# Install necessary dependencies
RUN apk add --no-cache \
        ca-certificates \
        gcc \
        wget \
        openssl \
        bash \
        libc6-compat \
        openjdk8-jre

# Set environment variables for Rust
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=1.76.0

# Install Rust
RUN set -eux; \
    apkArch="$(apk --print-arch)"; \
    case "$apkArch" in \
        x86_64) rustArch='x86_64-unknown-linux-musl'; rustupSha256='7aa9e2a380a9958fc1fc426a3323209b2c86181c6816640979580f62ff7d48d4' ;; \
        aarch64) rustArch='aarch64-unknown-linux-musl'; rustupSha256='b1962dfc18e1fd47d01341e6897cace67cddfabf547ef394e8883939bd6e002e' ;; \
        *) echo >&2 "unsupported architecture: $apkArch"; exit 1 ;; \
    esac; \
    url="https://static.rust-lang.org/rustup/archive/1.26.0/${rustArch}/rustup-init"; \
    wget "$url"; \
    echo "${rustupSha256} *rustup-init" | sha256sum -c -; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host ${rustArch}; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version; \
    apk del wget

# Set environment variables for Android
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Download and extract Android SDK
RUN cd /usr/local && \
    wget -q https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    tar -xzf android-sdk_r24.4.1-linux.tgz && \
    rm android-sdk_r24.4.1-linux.tgz

# Update Android SDK
RUN echo y | ${ANDROID_HOME}/tools/android update sdk --no-ui --all --filter platform-tools,android-18,build-tools-23.0.3

# Download and extract Android NDK
RUN cd /usr/local && \
    wget -q http://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip && \
    unzip -q android-ndk-r12b-linux-x86_64.zip && \
    rm android-ndk-r12b-linux-x86_64.zip

ENV NDK_HOME /usr/local/android-ndk-r12b

CMD ["/bin/bash"]