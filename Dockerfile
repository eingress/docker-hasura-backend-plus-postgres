ARG POSTGRES_VERSION

FROM postgres:${POSTGRES_VERSION}

ARG POSTGRES_VERSION
ARG POSTGIS_VERSION

RUN apt-get update \
	&& apt-cache showpkg postgresql-${POSTGRES_VERSION}-postgis-${POSTGIS_VERSION} \
	&& apt-get install -y --no-install-recommends \
	postgresql-${POSTGRES_VERSION}-postgis-${POSTGIS_VERSION} \
	postgresql-${POSTGRES_VERSION}-postgis-${POSTGIS_VERSION}-scripts \
	&& rm -rf /var/lib/apt/lists/* /var/tmp/*

ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN mkdir -p /docker-entrypoint-initdb.d

ADD ./db /docker-entrypoint-initdb.d/
