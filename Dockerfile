FROM debian:buster-slim
LABEL maintainer="Veit Olschinski <volschin@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install base environment
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends apt-utils \
  && apt-get install -qqy --no-install-recommends \
  apt-transport-https \
  bash \
  netcat \
  perl \
  && apt-get autoremove && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://svn.fhem.de/fhem/trunk/fhem/contrib/PRESENCE/collectord /collectord
# COPY src/collectord.conf /collectord.conf
COPY entry.sh /entry.sh
RUN chmod 755 /*.sh /collectord

EXPOSE 5222

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 CMD nc -z localhost 5222

ENTRYPOINT [ "/entry.sh" ]
CMD [ "start" ]
