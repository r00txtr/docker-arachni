FROM debian:12

ARG VERSION=1.6.1.3
ARG WEB_VERSION=0.6.1.1

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends wget ca-certificates libcurl4 libcurl4-openssl-dev libnghttp2-14 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN mkdir /arachni && \
    wget -qO- https://github.com/Arachni/arachni/releases/download/v${VERSION}/arachni-${VERSION}-${WEB_VERSION}-linux-x86_64.tar.gz | tar xvz -C /arachni --strip-components=1

# Add a new user 'admin' with home directory and no password
RUN useradd -m -s /bin/bash admin && \
    chown -R admin:admin /arachni

# Switch to the new user
USER admin

WORKDIR /arachni
EXPOSE 9292
