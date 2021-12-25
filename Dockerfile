FROM python:3.10.1-slim@sha256:dd3016f846b8f88d8f6c28b43f1da899f07259121aff403091e6f89a703c3d36

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
