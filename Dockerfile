FROM perl:5.28-slim-threaded
LABEL maintainer="Veit Olschinski <volschin@gmail.com>"

#RUN apk add --update netcat-openbsd && rm -rf /var/cache/apk/*

ADD https://svn.fhem.de/fhem/trunk/fhem/contrib/PRESENCE/collectord /collectord
# COPY src/collectord.conf /collectord.conf
COPY entry.sh /entry.sh
RUN chmod 755 /*.sh /collectord

EXPOSE 5222

#HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 CMD nc -z localhost 5222

ENTRYPOINT [ "/entry.sh" ]
CMD [ "start" ]
