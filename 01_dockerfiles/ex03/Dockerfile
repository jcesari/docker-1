FROM ubuntu:16.04

EXPOSE 80 22

RUN apt-get update -y && \
	apt-get upgrade -y

RUN apt-get install -y	sudo \
	openssh-client \
	curl \
	openssh-server \
	ca-certificates \
	tzdata

RUN mkdir -p /opt/gitlab/sv/sshd/supervise \
	&& mkfifo /opt/gitlab/sv/sshd/supervise/ok \
	&& printf "#!/bin/sh\nexec 2>&1\numask 077\nexec /usr/sbin/sshd -D" > /opt/gitlab/sv/sshd/run \
	&& chmod a+x /opt/gitlab/sv/sshd/run \
	&& ln -s /opt/gitlab/sv/sshd /opt/gitlab/service \
	&& mkdir -p /var/run/sshd

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

RUN apt install -y gitlab-ce

RUN echo "external_url \"http://localhost/\"" > /etc/gitlab/gitlab.rb

ADD start.sh /root/start.sh

RUN chmod +x /root/start.sh

ENTRYPOINT	/root/start.sh
#docker build -t ubu .
#docker run -it --rm -p 8000:80 -p 21:22 --privileged ubu