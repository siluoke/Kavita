FROM ubuntu:focal AS copytask


RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install wget \
    && rm -rf /var/lib/apt/lists/* 

RUN wget -q -O /usr/local/kavita-linux-x64.tar.gz https://github.com/Kareadita/Kavita/releases/download/v0.7.1.4/kavita-linux-x64.tar.gz && \
    tar xzf /usr/local/kavita-linux-x64.tar.gz -C /usr/local/ --strip-components=1 && \
    rm /usr/local/kavita-linux-x64.tar.gz && \
    chmod +x /usr/local/Kavita
    

EXPOSE 5000

ENTRYPOINT [ "/bin/bash" ]

CMD ["/usr/local/Kavita"]
