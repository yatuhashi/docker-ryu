FROM ubuntu:16.04

MAINTAINER yatuhashi kei <keyansuiya@gmail.com>

ENV HOME /root
WORKDIR /root

RUN apt-get update && apt-get install -y \
    curl \
    python-dev \
    python-pip \
    python-eventlet \
    python-lxml \
    python-msgpack \
    iproute2 \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    zlib1g-dev \
    vim \
    libnss3-tools \
    build-essential \
    checkinstall \
    openssl \
    sqlite3 \
    gcc \
    make \
    git

RUN git clone https://github.com/yyuu/pyenv.git /root/.pyenv
ENV HOME  /root/
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN /root/.pyenv/bin/pyenv install 3.5.0 \
 && /root/.pyenv/bin/pyenv global 3.5.0 \
 && python --version \
 && pip install ryu \
 && pip install tinyrpc

ADD test /root/
