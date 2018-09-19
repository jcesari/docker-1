# In terminal:
# docker build --file=Dockerfile --tag=ft-rails:on-build .

FROM ruby:2.4.1

RUN ["apt-get", "-y", "update"]
RUN ["apt-get", "install", "-y", "sqlite3"]
RUN ["gem", "install", "rails"]

ONBUILD COPY [".", "/opt/app"]
ONBUILD WORKDIR /opt/app

ONBUILD RUN gem install bundler rails && bundle install --jobs 20 --retry 5
ONBUILD EXPOSE 3000

CMD ["rails", "server"]