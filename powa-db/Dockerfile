FROM postgres:latest
MAINTAINER Rens Verhage <rensverhage@gmail.com>

RUN apt-get update

# install needed packages
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get install -qq -y wget ca-certificates unzip make sudo postgresql-server-dev-9.4 postgresql-contrib-9.4

WORKDIR /usr/local/src
RUN wget -q -O- https://github.com/dalibo/powa-archivist/archive/REL_2_0_0.tar.gz | tar -xzf -

WORKDIR /usr/local/src/powa-archivist-REL_2_0_0
RUN ./install_all.sh

# configure powa on start
ADD init_powa-db.sh /docker-entrypoint-initdb.d/

# clean-up (reset workdir to default prevent workdir from getting removed)
WORKDIR /
RUN rm -rf /var/lib/apt/lists/*
RUN export SUDO_FORCE_REMOVE=yes
RUN DEBIAN_FRONTEND=noninteractive \
	SUDO_FORCE_REMOVE=yes \
	apt-get purge -qq -y --auto-remove wget ca-certificates unzip make sudo postgresql-server-dev-9.4

