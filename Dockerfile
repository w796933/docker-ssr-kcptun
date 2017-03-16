FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y git build-essential wget python
	
RUN wget https://github.com/jedisct1/libsodium/releases/download/1.0.11/libsodium-1.0.11.tar.gz
RUN tar xf libsodium-1.0.11.tar.gz
    	
RUN cd /libsodium-1.0.11 && \
    ./configure && make -j2 && \
    make install && \
	ldconfig && \
	cd ..
RUN git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git && \
    cd /shadowsocksr && \
	bash initcfg.sh && \
    cd ..	

RUN wget https://github.com/xtaci/kcptun/releases/download/v20170315/kcptun-linux-amd64-20170315.tar.gz
RUN tar xf kcptun-linux-amd64-20170315.tar.gz
RUN chmod +x ./server_linux_amd64
	

RUN apt-get remove -y git build-essential wget python
RUN rm -rf /var/lib/apt/lists/*

ADD ./start.sh /
WORKDIR /
CMD ["sh", "-x", "/start.sh"]