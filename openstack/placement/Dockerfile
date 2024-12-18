# FROM ubuntu:24.04
FROM ubuntu/apache2:2.4-24.04_beta

RUN apt update \
	&& apt install -y placement-api \
		python3-openstackclient
# Remove default so it doesnt listen on port 80
RUN rm /etc/apache2/sites-enabled/000-default.conf

CMD ["apache2-foreground"]
