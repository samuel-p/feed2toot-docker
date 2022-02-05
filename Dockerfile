FROM python:3.10.2-slim@sha256:42d13fdfccf5d97bd23f9c054f22bde0451a3da0a7bb518bcd95fec6be89b50d

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
