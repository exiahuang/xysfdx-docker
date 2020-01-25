FROM azul/zulu-openjdk-alpine:13.0.1

RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ --no-cache \
  git \
  nodejs \
  nodejs-npm \
  yarn \
  jq \
  curl

# apk apache-ant is too big
# Installs Ant
ENV ANT_VERSION 1.10.7
RUN cd && \
    wget -q http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

RUN npm install --global sfdx-cli \
  prettier \
  prettier-plugin-apex

# install exiahuang/sfdx-xy-plugin
RUN git clone https://github.com/exiahuang/sfdx-xy-plugin /opt/sfdx-xy-plugin && \
    cd /opt/sfdx-xy-plugin && \
    npm install && \
    sfdx plugins:link .

# change to root folder
WORKDIR /app/sfdx