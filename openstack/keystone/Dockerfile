# FROM ubuntu:24.04
FROM ubuntu/apache2:2.4-24.04_beta

RUN apt update \
	&& apt install -y keystone

# Keystone defaults to 5000 port in Apache2 config
RUN sed -i -e 's/5000/5555/g' /etc/apache2/sites-enabled/keystone.conf

RUN su -s /bin/sh -c "keystone-manage db_sync" keystone
RUN su -s /bin/sh -c "keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone" keystone
RUN su -s /bin/sh -c "keystone-manage credential_setup --keystone-user keystone --keystone-group keystone" keystone

RUN su -s /bin/sh -c "keystone-manage bootstrap --bootstrap-password ADMIN_PASS --bootstrap-admin-url http://controller:5555/v3/ --bootstrap-internal-url http://controller:5555/v3/ --bootstrap-public-url http://controller:5555/v3/ --bootstrap-region-id RegionOne" keystone

CMD ["apache2-foreground"]
