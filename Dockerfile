FROM node:17-alpine

COPY package.json yarn.lock /

RUN apk add --quiet --no-cache \
    git \
    bash \
  && apk add --quiet --no-cache --virtual .gyp \
    python \
    build-base \
    git \
  && yarn \
  && yarn cache clean \
  && apk --quiet del .gyp

ENTRYPOINT ["/node_modules/.bin/renovate"]

