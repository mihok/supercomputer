# FROM ubuntu:24.04
FROM ubuntu/apache2:2.4-24.04_beta

RUN apt update \
	&& apt install -y openstack-dashboard \
		python3-openstackclient
# Remove default so it doesnt listen on port 80
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN rm /etc/apache2/conf-enabled/openstack-dashboard.conf

# Enable mod_rewrite
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load 

CMD ["apache2-foreground"]
