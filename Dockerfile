FROM ubuntu:20.04
USER root
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME /root

RUN apt-get -qq update
RUN apt-get -qqy install gnupg2 curl jq git

# Shift timezone
RUN apt-get -y install tzdata && \
    apt-get -qqy install locales && \
    locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# python
RUN apt-get -qqy install python3 python3-pip

# zulu java 14
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 && \
    echo "deb http://repos.azulsystems.com/ubuntu stable main" >> /etc/apt/sources.list.d/zulu.list && \
    apt-get -qq update && \
    apt-get -qqy install zulu-14

# node
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -qqy nodejs yarn

# heroku
RUN npm install -g heroku sfdx-cli prettier prettier-plugin-apex

# Installs Ant
ENV ANT_VERSION 1.10.12
RUN cd && \
    curl -O http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

# install exiahuang/sfdx-xy-plugin
# sfdx plugin.
RUN git clone https://github.com/exiahuang/sfdx-xy-plugin /opt/sfdx-xy-plugin && \
    cd /opt/sfdx-xy-plugin && \
    npm install && \
    sfdx plugins:link .

# install https://github.com/exiahuang/sfdc-cli
# exiahuang/sfdc-cli is a sfdc development kit
RUN pip3 install sfdc-cli

# change to root folder
WORKDIR /app/sfdx

# clean
RUN apt clean && rm -rf /var/lib/apt/lists/* && npm cache clean --force && rm -rf ~/.cache/
