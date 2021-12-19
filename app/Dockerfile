FROM ubuntu:20.04
MAINTAINER mragicl.eth <mragicl@protonmail.com>

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install git build-essential cmake wget curl ccze





