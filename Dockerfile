FROM ruby:2.7.8-bullseye

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends curl build-essential postgresql-client \
 && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
 && apt-get install -y --no-install-recommends nodejs \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /myapp


COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp
COPY entrypoint.sh /usr/bin/

# Normalize Windows line endings if present and make executable
RUN sed -i 's/\r$//' /usr/bin/entrypoint.sh \
 && chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
