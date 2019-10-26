FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /var/www
WORKDIR /var/www
ADD Gemfile /var/www/Gemfile
ADD Gemfile.lock /var/www/Gemfile.lock
RUN apt-get install bundler -v 1.17.1
RUN gem install bundler
RUN bundle install
ADD . /var/www
