FROM ubuntu

RUN apt-get update

RUN apt-get install -y git 

RUN apt-get install -y curl

RUN apt-get -y autoclean

RUN curl https://sh.rustup.rs  --output rustup

RUN sh rustup -y

RUN git clone https://github.com/paritytech/parity 

WORKDIR /parity

RUN pwd

RUN  apt-get install -y build-essential

RUN apt-get install -y libudev-dev

RUN ~/.cargo/bin/cargo build --release

WORKDIR /

RUN apt-get install -y python

RUN git clone https://github.com/parity-js/shell.git

RUN apt-get install -y net-tools

WORKDIR home/

RUN git clone https://github.com/lucachaco/medical-record 

#install node

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 9.0.0

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v


#RUN export PATH=$PATH:/parity/target/release

#parity --force-ui --ui-interface all --jsonrpc-interface all --ws-interface all --ws-origins all --ws-hosts all
