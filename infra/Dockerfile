FROM ubuntu

RUN apt-get update && apt-get update

RUN apt-get install -y git 

RUN apt-get install -y curl

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

#RUN apt-get install -y libssl-dev

RUN curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh

RUN bash install_nvm.sh

RUN git clone https://github.com/parity-js/shell.git

RUN apt-get install -y net-tools

WORKDIR home/

RUN git clone https://github.com/lucachaco/medical-record 

RUN export PATH=$PATH:/parity/target/release
