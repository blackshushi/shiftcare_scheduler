FROM ruby:3.0.3-alpine

RUN apk update && apk add build-base nodejs tzdata docker ca-certificates yarn curl && apk add --no-cache bash git openssh && apk --update add imagemagick xz-dev && mkdir /app && mkdir -p app/tmp/pids 

WORKDIR /app

COPY package.json package-lock.json /app/

RUN yarn install 

COPY Gemfile Gemfile.lock /app/
RUN RAILS_ENV=production bundle install --binstubs 

COPY . /app

RUN chmod +x app/lib/docker-entrypoint.sh

ENTRYPOINT ["app/lib/docker-entrypoint.sh"]

CMD ["RAILS_ENV=production bundle exec rails server"]