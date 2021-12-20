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

#RUST
USER root
WORKDIR /home/builder
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

#kintsugi lighthouse
USER root
WORKDIR /home/builder
RUN git clone -b unstable https://github.com/sigp/lighthouse.git
WORKDIR /home/builder/lighthouse
RUN make
RUN cp ~/.cargo/bin/lighthouse /usr/local/bin

#testnet files repo
USER builder
WORKDIR /home/builder
RUN git clone https://github.com/parithosh/consensus-deployment-ansible.git


#clean up
USER root
WORKDIR /home/builder
RUN rm -rf lighthouse
RUN chmod a+x  /usr/local/bin/lighthouse

# setting up user for lighthouse
USER root
RUN useradd -ms /bin/bash lighthousebeacon
RUN mkdir -p /var/lib/lighthouse
#RUN cp -r /home/builder/consensus-deployment-ansible/kintsugi-testnet /var/lib/lighthouse
RUN chown -R lighthousebeacon:lighthousebeacon /var/lib/lighthouse
# http port
expose 15052
# p2p port
expose 19000



USER root
RUN ls
COPY run_lighthousebeacon.sh /home/lighthousebeacon
RUN chmod a+x /home/lighthousebeacon/run_lighthousebeacon.sh
COPY initialize_validator.sh /home/lighthousebeacon
CMD /home/lighthousebeacon/run_lighthousebeacon.sh




