FROM python:3.10.4-slim@sha256:f17b9f852e67bd6063533842bb17c793aa0a5eed4b3691416f8c44a7649ba105

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
