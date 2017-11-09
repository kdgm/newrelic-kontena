FROM newrelic/infrastructure:latest

MAINTAINER Klaas Jan Wierenga <k.j.wierenga@gmail.com>

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
