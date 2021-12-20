FROM ubuntu:20.04
MAINTAINER mragicl.eth <mragicl@protonmail.com>

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install git build-essential cmake wget curl ccze

RUN useradd -ms /bin/bash builder
USER builder
WORKDIR /home/builder
#GO
RUN wget https://go.dev/dl/go1.17.4.linux-amd64.tar.gz
USER root
RUN  rm -rf /usr/local/go &&  tar -C /usr/local -xzf go1.17.4.linux-amd64.tar.gz
USER root
ENV PATH="/usr/local/go/bin:${PATH}"
RUN rm go1.17.4.linux-amd64.tar.gz

## eth2-val-tools and ethereal
RUN go install github.com/protolambda/eth2-val-tools@latest
RUN go install github.com/wealdtech/ethereal@latest
ENV PATH="/root/go/bin:${PATH}"


## node js
RUN apt-get install -y nodejs npm
WORKDIR /app
COPY makewallet.js /app
RUN npm install  ethereumjs-wallet

WORKDIR /home/builder
COPY devnet_deposits.sh /home/builder
RUN chmod a+x devnet_deposits.sh
RUN apt-get install -y jq
