FROM debian

RUN apt-get update && apt-get install -y \
    sudo \
    vim \
    nmap \
    tcptraceroute \
    python3 \
    python3-pip \
    python3-venv \
    zsh \
    man \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    git

RUN useradd -ms /bin/bash dev21 && echo "dev21:dev21" | chpasswd && adduser dev21 sudo
USER dev21
WORKDIR /home/dev21 

RUN git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen" \
    && mkdir -p "${HOME}/.vim/colors" \
    && ln -s "${HOME}/code/molokai/colors/molokai.vim" "${HOME}/.vim/colors" \
    && ln -s "${HOME}/code/zshrc/.zshrc" "${HOME}/" \
    && wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-389.0.0-linux-x86_64.tar.gz -P "${HOME}/tmp" \
    && tar -xf "${HOME}/tmp/google-cloud-cli-389.0.0-linux-x86_64.tar.gz" -C "${HOME}" \
    && ${HOME}/google-cloud-sdk/install.sh -q \
    && rm -rf "${HOME}/tmp" \
    && python3 -m pip install requests
