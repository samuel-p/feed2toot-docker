FROM python:3
MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron

COPY cron /etc/cron.d/feed2toot

RUN chmod 0644 /etc/cron.d/feed2toot

RUN crontab /etc/cron.d/feed2toot

WORKDIR feed2toot

CMD ["cron", "-f"]