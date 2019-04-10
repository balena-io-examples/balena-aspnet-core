#!/bin/bash

BALENA_ARCH="${1:-amd64}"
DOTNET_VARIANT="${2:-sdk}"
DOTNET_VERSION="${3:-v22}"

case "$BALENA_ARCH" in
    "amd64")
        DOTNET_ARCH="amd64"
        ;;
    "armv7hf")
        DOTNET_ARCH="arm32"
        ;;
    *)
        echo "BALENA_ARCH=$BALENA_ARCH is not supported..."
        exit 1
        ;;
esac

# https://github.com/dotnet/core/blob/master/release-notes/2.2/2.2.3/2.2.3-download.md
RUNTIME_AMD64_v22="https://download.visualstudio.microsoft.com/download/pr/dabca6d9-19e5-44b6-a402-a627fae42d26/e36d703f5d281ec8662422bfa62c2fdd/aspnetcore-runtime-2.2.3-linux-x64.tar.gz"
SDK_AMD64_v22="https://download.visualstudio.microsoft.com/download/pr/7d8f3f4c-9a90-42c5-956f-45f673384d3f/14d686d853a964025f5c54db237ff6ef/dotnet-sdk-2.2.105-linux-x64.tar.gz"
RUNTIME_ARM32_v22="https://download.visualstudio.microsoft.com/download/pr/280390c7-10ab-46bc-bd62-886751517624/b6b98756380556e39a6a96a920aa4b67/aspnetcore-runtime-2.2.3-linux-arm.tar.gz"
SDK_ARM32_v22="https://download.visualstudio.microsoft.com/download/pr/74ce4696-c78e-45c0-9cb2-f504e8d00a6f/152f760e7f1d9f3448038e3864ee5277/dotnet-sdk-2.2.105-linux-arm.tar.gz"

DOWNLOAD_VARIANT="${DOTNET_VARIANT^^}_${DOTNET_ARCH^^}_${DOTNET_VERSION}"
DOWNLOAD_URL="${!DOWNLOAD_VARIANT}"

wget -c "$DOWNLOAD_URL" -O /tmp/dotnet.tar.gz && \
    mkdir -p /opt/dotnet && \
    tar -xvf /tmp/dotnet.tar.gz -C /opt/dotnet && \
    ln -s /opt/dotnet/dotnet /usr/bin/dotnet && \
    rm /tmp/dotnet.tar.gz

echo "Installed into /usr/bin/dotnet"