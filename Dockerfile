FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /spatium

WORKDIR /spatium

COPY Gemfile /spatium/Gemfile

COPY Gemfile.lock /spatium/Gemfile.lock

RUN bundle install

ADD . /spatium
