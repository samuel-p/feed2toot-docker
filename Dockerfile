FROM python:3.10.4-slim@sha256:cd62775c2141dc3d06c1b284ceda8ebe329d588ab398b0fc296248bca5fec64a

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
