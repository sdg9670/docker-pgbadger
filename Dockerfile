FROM ubuntu:20.10
RUN apt-get update
RUN apt-get install -y wget perl make
WORKDIR /pgbadger
ARG PGBADGER_VERSION
ENV PGBADGER_VERSION = ${PGBADGER_VERSION}
RUN wget -O pgbadger.tar.gz https://github.com/darold/pgbadger/archive/v${PGBADGER_VERSION}.tar.gz
RUN tar -xvzf pgbadger.tar.gz
RUN rm pgbadger.tar.gz
RUN mv pgbadger-${PGBADGER_VERSION} pgbadger
WORKDIR /pgbadger/pgbadger
RUN perl Makefile.PL
RUN make && make install
WORKDIR /pgbadger
RUN mkdir logs
RUN mkdir outs
WORKDIR /pgbadger/outs
CMD [ "sh", "-c", "pgbadger ${PARAMETERS} ../logs/${FILE_NAME}" ]