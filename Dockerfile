FROM python:3.10.3-slim@sha256:3309403a0cb622098f33f732be54aea031b222423b262e47126bcfb2aee5362d

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
