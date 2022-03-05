FROM python:3.10.2-slim@sha256:3c87795ae452dd07ab6c87d1d2ba9ae9cc6f0063c49b8ae5c06e13ecfbae9d4d

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
