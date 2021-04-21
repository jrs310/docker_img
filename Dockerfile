FROM ubuntu:latest

LABEL maintainer="Jose Sanchez" \
      name="main_container" \
      version="1.0"

ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt update -y \
    && apt upgrade -y  \
    && apt-get install -y python3-pip python3-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 --no-cache-dir install --upgrade pip \
    && apt-get install nano \
    && pip install requests \
    && pip install json \
    && apt -y install git-all\
    && apt-get -y install curl \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*



RUN useradd --create-home --shell /bin/bash tso
USER tso
WORKDIR /home/tso 


ENTRYPOINT ["python3"]