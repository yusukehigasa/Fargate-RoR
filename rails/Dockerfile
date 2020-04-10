FROM ruby:2.6.5-alpine

# Install packages
RUN apk upgrade --no-cache && \
    apk add --update --no-cache \
      vim \
      make \
      git \
      nodejs \
      yarn \
      tzdata && \
    apk add --update --no-cache --virtual=build-dependencies \
      build-base \
      mariadb-dev \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      ruby-dev \
      yaml-dev \
      zlib-dev

RUN gem install sassc -- --disable-march-tune-native

# For 'bundle install' not run every time
WORKDIR /tmp

# For copy Gemfile from host to guest
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

# For install gems
RUN bundle install

# For install yarn packages
RUN yarn install

# Remove packages as dependencies
#RUN apk del build-dependencies

# For set work dir
WORKDIR /webapp
ADD . /webapp

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

RUN bundle exec rails assets:precompile RAILS_ENV=production

# Expose volumes to frontend
VOLUME /webapp/public
VOLUME /webapp/tmp

#CMD ["bundle", "exec", "puma", "-C", "/webapp/config/puma.rb"]
CMD ash -c "rm -f /webapp/tmp/pids/server.pid && bundle exec puma -C /webapp/config/puma.rb"
