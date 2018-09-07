#1/bin/bash
docker network create \
	--driver overlay \
	--subnet 10.0.2.0/24 \
	--attachable \
	condor_pool_net
