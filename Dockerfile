FROM openjdk:17-alpine

RUN adduser --disabled-password mine

WORKDIR /opt/mineserver

RUN apk update && apk upgrade
RUN apk add curl
RUN curl https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar --output server.jar

COPY eula.txt .
COPY server.properties .
COPY bin ./bin

# USER mine

EXPOSE 25565

ENTRYPOINT [ "/opt/mineserver/bin/start_server.sh" ]
