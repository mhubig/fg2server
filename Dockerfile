FROM buildpack-deps:jessie

ENV HOME /usr/src/app
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y unzip

RUN mkdir -p /tmp/fg2n_server && cd /tmp/fg2n_server \
    && curl -SLO ftp://80.153.164.175/serverdev/fg2n_server_150723.zip \
    && unzip fg2n_server_150723.zip \
    && sh ./make_fg2_ubx64.sh \
    && cp ./fg2serv_ubx64 /usr/src/app/fg2server \
    && rm -rf /tmp/fg2n_server

RUN mkdir -p /tmp/fg2n_decode && cd /tmp/fg2n_decode \
    && curl -SLO ftp://80.153.164.175/serverdev/fg2n_decode_150622.zip \
    && unzip fg2n_decode_150622.zip \
    && sh ./make_decode_ubx64.sh \
    && cp ./decode_ubx64 /usr/src/app/fg2decode \
    && rm -rf /tmp/fg2n_decode

RUN mkdir -p /tmp/fg2n_decode2 && cd /tmp/fg2n_decode2 \
    && curl -SLO ftp://80.153.164.175/serverdev/decode2_150804.zip \
    && unzip decode2_150804.zip \
    && sh ./make_decode2_ubx64.sh \
    && cp ./decode2_ubx64 /usr/src/app/fg2decode2 \
    && rm -rf /tmp/fg2n_decode2

COPY fg2serv.ini /usr/src/app/

EXPOSE 8123
VOLUME ["/usr/src/app/data"]

CMD ["/usr/src/app/fg2server"]
