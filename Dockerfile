FROM python:3.10.2-slim@sha256:8324222536bd1d09aeedfd9236998a227ae482411b271d0e10e61dbac899e403

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
