FROM node:12-alpine

COPY package.json yarn.lock /

RUN apk add --quiet --no-cache \
    git \
  && yarn \
  && yarn cache clean

ENTRYPOINT ["/node_modules/.bin/renovate"]

