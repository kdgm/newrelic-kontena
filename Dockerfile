# FROM: https://hub.docker.com/r/christianbladescb/newrelic-coreos/
FROM christianbladescb/newrelic-coreos

MAINTAINER Klaas Jan Wierenga <k.j.wierenga@gmail.com>

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/nrsysmond", "-F", "-E", "-l", "/dev/stdout"]
