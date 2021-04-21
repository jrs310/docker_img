FROM ubuntu:latest

LABEL maintainer="Jose Sanchez" \
      name="main_container" \
      version="1.0"

ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt update -y \
    && apt upgrade -y  \
    && cd /usr/local/bin \
    && pip3 --no-cache-dir install --upgrade pip \
    && apt-get -y install nano \
    && apt-get install -y virtualenv\
    && apt -y install git-all\
    && apt-get -y install curl \
    && apt install python3 -y \
    && apt install python3-pip -y \
    && apt-get -y install python3-venv\
    && python3 -m venv venv\
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*



RUN useradd --create-home --shell /bin/bash tso
USER tso
WORKDIR /home/tso


ENTRYPOINT bin/bash


