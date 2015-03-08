FROM ubuntu:utopic
MAINTAINER Rens Verhage <rensverhage@gmail.com>

RUN apt-get update > /dev/null 2>&1
RUN apt-get -y upgrade > /dev/null 2>&1
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y install python-dev libpq-dev python-pip > /dev/null 2>&1

RUN pip install powa-web > /dev/null 2>&1

ADD powa-web.conf /etc/powa-web.conf

CMD powa-web

