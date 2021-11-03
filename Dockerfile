FROM python:3.10.0-slim@sha256:afb1c0afba1f13e434c0288e49a17c8e472d7286cff5b915848c0561926073eb

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
