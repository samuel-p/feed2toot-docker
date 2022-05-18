FROM python:3.10.4-slim@sha256:54956d6c929405ff651516d5ebbc204203a6415c9d2757aaddcde35be680431e

MAINTAINER mail@sp-codes.de

RUN pip3 install feed2toot

RUN apt-get update && apt-get -y install cron curl

WORKDIR feed2toot

COPY cron /feed2toot/cron

CMD crontab /feed2toot/cron && cron -f
