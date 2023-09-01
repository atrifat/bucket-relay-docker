FROM node:18-alpine as builder

WORKDIR /builder

RUN apk add --no-cache --virtual .build-deps -U git

RUN git clone --depth 1 --branch master https://github.com/coracle-social/bucket

WORKDIR /builder/bucket

RUN yarn

# Start app in final image to reduce image size
FROM node:18-alpine as final

ENV PORT=4736
ENV PURGE_INTERVAL=86400
ARG APP_USER=node

WORKDIR /app

COPY --from=builder /builder/bucket /app

RUN chown -R $APP_USER:$APP_USER /app

USER $APP_USER

EXPOSE $PORT

ENTRYPOINT ["yarn", "start"]