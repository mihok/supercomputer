# FROM ubuntu:24.04
FROM ubuntu/apache2:2.4-24.04_beta

RUN apt update \
	&& apt install -y keystone \
		python3-openstackclient

# Remove default so we dont listen on port 80
RUN rm /etc/apache2/sites-enabled/000-default.conf

# Keystone defaults to 5000 port in Apache2 config
RUN sed -i -e 's/5000/5555/g' /etc/apache2/sites-enabled/keystone.conf

RUN su -s /bin/sh -c "keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone" keystone
RUN su -s /bin/sh -c "keystone-manage credential_setup --keystone-user keystone --keystone-group keystone" keystone

CMD ["apache2-foreground"]
