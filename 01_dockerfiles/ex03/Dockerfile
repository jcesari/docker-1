FROM ubuntu:16.04

RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
	ca-certificates \
	openssh-server \
	curl \
	postfix

WORKDIR /
RUN curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

RUN bash script.deb.sh

RUN apt-get update && EXTERNAL_URL="http://gitlab.example.com" apt-get install -yq gitlab-ce

# Missing Time Zone Data /usr/share/zoneinfo
# https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2229
RUN apt update && apt install -y tzdata && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22 8000

ADD https://gist.githubusercontent.com/jcesari/4dc7358e9db3eba1a44b58f6713614d0/raw/35bd71b5c7a468f0a56921b0db432b08a9d10c6c/start.sh start.sh
RUN chmod +x /start.sh

CMD [ "bash", "/start.sh" ]
#docker build -t ubu .
#docker run -it --rm -p 80:80 -p 21:22 --privileged ubu