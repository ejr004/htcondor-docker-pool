#!/bin/bash
cp /etc/simple_grid/config/59_site_security.conf /etc/condor-ce/config.d/
cp /etc/simple_grid/config/60_configured_attributes.conf /etc/condor-ce/config.d/
cp /etc/simple_grid/config/99.conf /etc/condor-ce/config.d/
cp /etc/simple_grid/config/condor_mapfile /etc/condor-ce/
cp /etc/simple_grid/config/hostcert.pem /etc/grid-security/
cp /etc/simple_grid/config/hostkey.pem /etc/grid-security/
chmod 600 /etc/grid-security/hostkey.pem
cp -rf /etc/simple_grid/config/certificates /etc/grid-security
cp -rf /etc/simple_grid/config/gsi.conf /etc/grid-security
cp -rf /etc/simple_grid/config/sleep_job /home/condor_user/sleep_job
chown -R condor_user /home/condor_user

cp /etc/simple_grid/config/condor/50PC.config /etc/condor/config.d/
cp /etc/simple_grid/config/condor/99.conf /etc/condor/config.d/

## shared port forwarding ##
swarm_str=$(ifconfig eth0 | grep inet)
swarm_arr=($swarm_str)
eth0_swarm_ip=${swarm_arr[1]}

docker_str=$(ifconfig eth1 | grep inet)
docker_arr=($docker_str)
eth1_docker_ip=${docker_arr[1]}

systemctl start condor
systemctl start condor-ce