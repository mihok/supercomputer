# FROM ubuntu:24.04
FROM ubuntu/apache2:2.4-24.04_beta

RUN apt update \
	&& apt install -y glance \
		python3-openstackclient
# Remove default so it doesnt listen on port 80
RUN rm /etc/apache2/sites-enabled/000-default.conf

RUN su -s /bin/sh -c "glance-manage db_sync" glance

RUN mkdir -p /var/log/glance
RUN mkdir -p /var/run/glance


EXPOSE 9191 9292

CMD ["glance-api"]
