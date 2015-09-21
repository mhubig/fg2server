FROM buildpack-deps:jessie

RUN mkdir -p /usr/src/fg2server
ENV HOME /usr/src/fg2server
WORKDIR /usr/src/fg2server

RUN apt-get update && apt-get install -y unzip

RUN mkdir -p /tmp/fg2n_server && cd /tmp/fg2n_server \
    && curl -SLO ftp://80.153.164.175/serverdev/fg2n_server_150820.zip \
    && unzip fg2n_server_150820.zip \
    && sh ./make_fg2_ubx64.sh \
    && cp ./fg2serv_ubx64 /usr/src/fg2server/fg2server \
    && rm -rf /tmp/fg2n_server

RUN mkdir -p /tmp/fg2n_decode2 && cd /tmp/fg2n_decode2 \
    && curl -SLO ftp://80.153.164.175/serverdev/decode2_150820.zip \
    && unzip decode2_150820.zip \
    && sh ./make_decode2_ubx64.sh \
    && cp ./decode2_ubx64 /usr/src/fg2server/fg2decode \
    && rm -rf /tmp/fg2n_decode2

COPY fg2serv.ini /usr/src/fg2server/fg2serv.ini

EXPOSE 8123
VOLUME ["/usr/src/fg2server/data"]

CMD ["/usr/src/fg2server/fg2server"]
