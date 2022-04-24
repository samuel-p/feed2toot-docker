FROM python:3.10.4-slim@sha256:ad719a882ac0594bdc92abccff22e5b6713bbf9893320264fd9e8affd8a6f470

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
