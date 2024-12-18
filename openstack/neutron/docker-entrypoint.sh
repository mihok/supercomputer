#!/bin/bash

# openvswitch agent
neutron-openvswitch-agent --config-file=/etc/neutron/neutron.conf --config-file=/etc/neutron/plugins/ml2/ml2_conf.ini --config-file=/etc/neutron/plugins/ml2/openvswitch_agent.ini --config-file=/etc/neutron/plugins/ml2/l3_agent.ini --config-file=/etc/neutron/plugins/ml2/dhcp_agent.ini &

# l3
neutron-l3-agent --config-file=/etc/neutron/neutron.conf --config-file=/etc/neutron/plugins/ml2/ml2_conf.ini --config-file=/etc/neutron/plugins/ml2/openvswitch_agent.ini --config-file=/etc/neutron/plugins/ml2/l3_agent.ini --config-file=/etc/neutron/plugins/ml2/dhcp_agent.ini &


# dhcp
neutron-dhcp-agent --config-file=/etc/neutron/neutron.conf --config-file=/etc/neutron/plugins/ml2/ml2_conf.ini --config-file=/etc/neutron/plugins/ml2/openvswitch_agent.ini --config-file=/etc/neutron/plugins/ml2/l3_agent.ini --config-file=/etc/neutron/plugins/ml2/dhcp_agent.ini &

# api
neutron-api --host 0.0.0.0 &

# server
neutron-server --config-file=/etc/neutron/neutron.conf --config-file=/etc/neutron/plugins/ml2/ml2_conf.ini --config-file=/etc/neutron/plugins/ml2/openvswitch_agent.ini --config-file=/etc/neutron/plugins/ml2/l3_agent.ini --config-file=/etc/neutron/plugins/ml2/dhcp_agent.ini



# wait -n

# exit $?
