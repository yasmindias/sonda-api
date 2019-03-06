FROM ruby:2.5

RUN mkdir -p /sonda
WORKDIR /sonda

COPY Gemfile /sonda/Gemfile
COPY Gemfile.lock /sonda/Gemfile.lock
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 3000

CMD ["rails server", "rake test"]
