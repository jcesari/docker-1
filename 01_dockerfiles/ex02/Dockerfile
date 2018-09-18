FROM ruby

RUN apt-get update -y && apt-get upgrade -y

RUN gem install rails

RUN apt-get install nodejs -y

# le Dockerfile dans le Dockerfile

ONBUILD COPY . /opt/app

ONBUILD WORKDIR /opt/app

ONBUILD RUN bundle install

ONBUILD RUN rails db:migrate

ONBUILD RUN db:seed