FROM wine

USER root

RUN apt-get update && apt-get install -y build-essential python2.7 python2.7-dev python2.7-dbg libdb5.3-dev mysql-client libmysqlclient-dev gdb mercurial

RUN ln -s /usr/lib/x86_64-linux-gnu/libmysqlclient.so /usr/lib/x86_64-linux-gnu/libmysqlclient_r.so

RUN mkdir /zone-staging

RUN hg clone https://bitbucket.org/grelminar/asss /asss-src && cd /asss-src
RUN cp /asss-src/src/system.mk.trusty.dist /asss-src/src/system.mk
RUN cd /asss-src/src && make
RUN cp -L -R /asss-src/dist/* /zone-staging/
RUN cp -L -R /asss-src/bin /zone-staging/bin
RUN wget --output-document=/zone-staging/bin/enc_cont.so https://bitbucket.org/grelminar/asss/downloads/enc_cont_1.6.0_libc2.11.1_64bit.so
RUN cd /zone-staging && wine /zone-staging/clients/continuum.exe Z 

WORKDIR /zone-staging
ADD run-asss /zone-staging

RUN chmod +x /zone-staging/run-asss

VOLUME /zone
EXPOSE 5000/tcp
EXPOSE 5000/udp
EXPOSE 5001/udp

CMD ["./run-asss"]
