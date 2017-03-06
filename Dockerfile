FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libcurl3-dev
RUN mkdir /internal_development_tools
WORKDIR /internal_development_tools
ADD . /internal_development_tools
RUN bundle install
