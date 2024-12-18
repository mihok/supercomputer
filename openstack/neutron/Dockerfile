FROM ubuntu/apache2:2.4-24.04_beta

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

RUN apt update \
	&& apt install -y neutron-server \
  		neutron-plugin-ml2 \
  		neutron-openvswitch-agent \
		neutron-l3-agent \
		neutron-dhcp-agent \
  		neutron-metadata-agent

CMD ["/docker-entrypoint.sh"]
