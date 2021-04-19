FROM ubuntu:20.04

LABEL maintainer="Jose Sanchez" \
      name="main_container" \
      version="1.0"


# Install packages
RUN apt update -y \
    && apt upgrade -y  \
    && apt install -y python3.8 \
    && apt-get install nano \
    && apt-get -y install curl \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Add dedicated  user
RUN useradd -m -d /srv sanchez
