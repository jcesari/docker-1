FROM debian

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install bzip2 -y

# Ports: 9987 default voice, 10011 server query, 30033 file transport
EXPOSE 9987/udp 10011 30033

RUN useradd ts3

WORKDIR /home/ts3

RUN curl http://dl.4players.de/ts/releases/3.0.13.6/teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2 > teamspeak-server.tar.bz2

RUN tar -xvjf teamspeak-server.tar.bz2

WORKDIR teamspeak3-server_linux_amd64

COPY ts3server.ini /home/t3/teamspeak3-server_linux_amd64/ts3server.ini

USER ts3

ENTRYPOINT ["sh","ts3server_minimal_runscript.sh","inifile=ts3server.ini"]

# docker container run --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 --name=c2 ts3
# entrer ip donnee par "docker-machine ip default"