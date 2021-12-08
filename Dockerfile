FROM python:3.10.1-slim@sha256:9ba08ac396df6210f82d3965811aea55bb94e78aeb4f830bbe0258b9678d51f5

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
