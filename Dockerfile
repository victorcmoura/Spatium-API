FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /spatium

WORKDIR /spatium

COPY Gemfile /spatium/Gemfile

COPY Gemfile.lock /spatium/Gemfile.lock

RUN bundle install

ADD . /spatium

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
