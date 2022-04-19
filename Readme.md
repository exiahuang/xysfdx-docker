# xysfdx-docker

- salesforce develope docker 
- for [exiahuang/xysfdx](https://github.com/exiahuang/xysfdx).

> xysfdx is a vscode plugin, a Rapid development tool for Salesforce Development.

# What's included

- base on ubuntu:20.04
- Zulu14 openjdk version "14.0.2"
- Apache Ant(TM) version 1.10.12
- git
- node v16.14.2
- npm 8.5.0
- sfdx-cli/7.146.1 linux-x64 node-v16.14.2
- prettier
- prettier-plugin-apex
- [exiahuang/sfdx-xy-plugin](https://github.com/exiahuang/sfdx-xy-plugin)
- [exiahuang/sfdc-cli](https://github.com/exiahuang/sfdc-cli) is a sfdc development kit.

# Use xysfdx and xysfdx-docker to develope salesforce

## install xysfdx in vscode

install [xysfdx](https://marketplace.visualstudio.com/items?itemName=ExiaHuang.xysfdx)

## pull images

pull images : `docker: pull image exiasfdc/sfdx`

![xysfdx-docker-image](https://raw.githubusercontent.com/exiahuang/xycode-doc/gh-pages/images/xysfdx-docker-image.gif)

## create container

create container : `docker: create sfdx container`

![xysfdx-docker-container](https://raw.githubusercontent.com/exiahuang/xycode-doc/gh-pages/images/xysfdx-docker-container.gif)

## use docker shell

use docker shell : `docker: attach docker shell`

![xysfdx-docker-bash](https://raw.githubusercontent.com/exiahuang/xycode-doc/gh-pages/images/xysfdx-docker-bash.gif)

then , use the `xysfdx` to develope sfdx.


## attention

- can not use `force:auth:web:login` or `force:auth:web:login:setdefaultusername`
- can not use `force:project:create`
- use `xy:auth:username:login` to auth

