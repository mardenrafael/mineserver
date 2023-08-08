FROM openjdk:17-bullseye
WORKDIR /opt/mineserver
RUN apt update -y && apt upgrade -y
RUN curl https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar --output server.jar
RUN java -jar server.jar
COPY eula.txt .
EXPOSE 25565
COPY server.properties .
CMD [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
