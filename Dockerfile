FROM ruby:2.6.5

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

COPY Gemfile /myapp
COPY Gemfile.lock /myapp

RUN gem install bundler -v 2.1.4
