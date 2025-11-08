FROM eclipse-temurin:8-jre-alpine

ARG SBT_VERSION=1.2.8

# Install dependencies including awscli
RUN apk update && \
    apk add --no-cache bash curl docker python3 py3-pip jq aws-cli

# Install sbt manually
RUN curl -L "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | tar xz -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/bin/sbt

# Verify installations
RUN sbt sbtVersion
