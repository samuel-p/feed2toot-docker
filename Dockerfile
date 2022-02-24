FROM python:3.10.2-slim@sha256:caa004dda01d364ae7403d3de1fe29c9e541698cb002e323174acc08902fd086

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
