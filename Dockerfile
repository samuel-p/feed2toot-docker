FROM python:3.10.0-slim@sha256:3148289e8e0c96d069c9df023bd4c17f1877fad2fee4f60c36d75ef307b48dd3

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
