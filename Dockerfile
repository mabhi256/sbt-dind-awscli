FROM eclipse-temurin:8-jre-alpine

ARG SBT_VERSION=1.2.8

# Install dependencies
RUN apk update && \
    apk add --no-cache bash curl docker python3 py3-pip jq

# Install sbt manually
RUN curl -L "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | tar xz -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/bin/sbt

# Install awscli
RUN pip3 install --upgrade pip && \
    pip3 install awscli

# Verify installations
RUN sbt sbtVersion
