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

# kintsugi geth
USER root
WORKDIR /home/builder
RUN git clone -b merge-kintsugi https://github.com/MariusVanDerWijden/go-ethereum.git
WORKDIR /home/builder/go-ethereum
RUN make geth
USER root
RUN cp ./build/bin/geth /usr/local/bin/

#testnet files repo
USER builder
WORKDIR /home/builder
RUN git clone https://github.com/parithosh/consensus-deployment-ansible.git


#clean up
USER root
WORKDIR /home/builder
RUN rm -rf go-ethereum

RUN chmod a+x /usr/local/bin/geth

#setting up user for geth
USER root
RUN useradd -ms /bin/bash goeth
RUN mkdir -p /var/lib/goethereum
RUN chown -R goeth:goeth /var/lib/goethereum
USER goeth
RUN /usr/local/bin/geth init /home/builder/consensus-deployment-ansible/kintsugi-testnet/custom_config_data/genesis.json --datadir /var/lib/goethereum

## api port
EXPOSE 8545
## p2p port
EXPOSE 30303
COPY run_geth.sh /home/goeth/
USER root
RUN chmod a+x /home/goeth/run_geth.sh
USER goeth
CMD /home/goeth/run_geth.sh








